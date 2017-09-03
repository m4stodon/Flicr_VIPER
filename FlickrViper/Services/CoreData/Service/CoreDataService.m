//
//  CoreDataService.m
//  FlickrViper
//
//  Created by Ermac on 9/3/17.
//  Copyright © 2017 Yermakov. All rights reserved.
//


#import "CoreDataService.h"
#import "CoreDataStack.h"
#import "Magazine+CoreDataProperties.h"
#import "Category+CoreDataProperties.h"


@interface CoreDataService()
@property (nonatomic, strong) CoreDataStack* coreDataStack;
@property (nonatomic, strong) NSManagedObjectContext* mainManagedObjectContext;
@property (nonatomic, strong) NSManagedObjectContext* backgroundManagedObjectContext;
@end

@implementation CoreDataService


#pragma mark - Lifecycle


+ (instancetype)sharedManager {
    static CoreDataService* service = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        service = [[CoreDataService alloc] init];
    });
    return service;
}

- (instancetype)init {
    self = [super init];
    if(self) {
        self.coreDataStack                  = [[CoreDataStack alloc] init];
        self.mainManagedObjectContext       = [self.coreDataStack createNewMainDatabaseContext];
        self.backgroundManagedObjectContext = [self.coreDataStack createNewBackgroundDatabaseContext];
    }
    return self;
}


#pragma mark - Actions


- (NSArray*)fetchMagazines {
    return [self fetchObjectsForName: @"Magazine"];
}


#pragma mark - NSFetchedResultsController


- (NSFetchedResultsController*)createNewFetchResultsControllerForEntityWithName: (NSString*)name sortDescriptior: (NSSortDescriptor*)sortDescriptor {
    
    NSFetchRequest* fetchRequest     = [[NSFetchRequest alloc] init];
    NSEntityDescription* description = [NSEntityDescription entityForName: name inManagedObjectContext: self.mainManagedObjectContext];
    NSArray* sortDescriptors         = [[NSArray alloc] initWithObjects: sortDescriptor, nil];
    fetchRequest.sortDescriptors     = sortDescriptors;
    [fetchRequest setEntity: description];
    [fetchRequest setFetchBatchSize: 30];
    
    NSFetchedResultsController* fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest: fetchRequest
                                                                                               managedObjectContext: self.mainManagedObjectContext
                                                                                                 sectionNameKeyPath: nil
                                                                                                          cacheName: nil];
    NSError* err = nil;
    if(![fetchedResultsController performFetch: &err]) {
        NSLog(@"Unresolved error %@, %@", err, [err userInfo]);
        abort();
    }
    return fetchedResultsController;
}


#pragma mark - Private


- (NSArray*)fetchObjectsForName: (NSString*)name {
    NSFetchRequest* fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity: [NSEntityDescription entityForName: name
                                         inManagedObjectContext: self.mainManagedObjectContext]];
    NSError* fetchError     = nil;
    NSArray* fetchedObjects = [self.mainManagedObjectContext executeFetchRequest: fetchRequest
                                                                           error: &fetchError];
    return fetchedObjects;
}

- (void)saveEntityForName: (NSString*)name withDictionary: (NSDictionary*)dictionary {
    NSEntityDescription* newEntity = [NSEntityDescription entityForName: name
                                                 inManagedObjectContext: self.backgroundManagedObjectContext];
    NSManagedObject* newMangedObject = [[NSManagedObject alloc] initWithEntity: newEntity
                                                insertIntoManagedObjectContext: self.backgroundManagedObjectContext];
    for (id key in dictionary) {
        [newMangedObject setValue: dictionary[key] forKey: key];
    }
    
    [self.coreDataStack saveContext: self.backgroundManagedObjectContext];
}

- (void)deleteEntityForName: (NSString*)name predicate: (NSPredicate*)predicate  {
    NSFetchRequest* fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity: [NSEntityDescription entityForName: name
                                         inManagedObjectContext: self.backgroundManagedObjectContext]];
    [fetchRequest setPredicate: predicate];
    NSError* fetchError     = nil;
    NSArray* fetchedObjects = [self.backgroundManagedObjectContext executeFetchRequest: fetchRequest
                                                                                 error: &fetchError];
    if([fetchedObjects count]) {
        NSManagedObject* objectToRemove = fetchedObjects.firstObject;
        [self.backgroundManagedObjectContext deleteObject: objectToRemove];
        [self.coreDataStack saveContext: self.backgroundManagedObjectContext];
    }
}

// TEST PURPOSE ONLY!!!
- (void)fillTheDatabase {
    NSEntityDescription* description = [NSEntityDescription entityForName: @"Category" inManagedObjectContext: self.backgroundManagedObjectContext];
    
    Category* category1 = [[Category alloc] initWithEntity: description insertIntoManagedObjectContext: self.backgroundManagedObjectContext];
    category1.title     = @"Science";
    [self.coreDataStack saveContext: self.backgroundManagedObjectContext];
    
    description = [NSEntityDescription entityForName: @"Magazine" inManagedObjectContext: self.backgroundManagedObjectContext];
    
    Magazine* magazine1    = [[Magazine alloc] initWithEntity: description insertIntoManagedObjectContext: self.backgroundManagedObjectContext];
    magazine1.category     = [NSSet setWithObjects: category1, nil];
    magazine1.title        = @"Issue #1";
    magazine1.details      = @"Issue #1 Description";
    magazine1.image        = @"Fallout4_AwesomeTales1";
    magazine1.views        = 200;
    magazine1.creationDate = [[NSDate alloc] initWithTimeIntervalSince1970: NSTimeIntervalSince1970];
    
    Magazine* magazine2    = [[Magazine alloc] initWithEntity: description insertIntoManagedObjectContext: self.backgroundManagedObjectContext];
    magazine2.category     = [NSSet setWithObjects: category1, nil];
    magazine2.title        = @"Issue #2";
    magazine2.details      = @"Issue #2 Description";
    magazine2.image        = @"Fallout4_AwesomeTales2";
    magazine2.views        = 301;
    magazine2.creationDate = [[NSDate alloc] initWithTimeIntervalSince1970: NSTimeIntervalSince1970];
    
    Magazine* magazine3    = [[Magazine alloc] initWithEntity: description insertIntoManagedObjectContext: self.backgroundManagedObjectContext];
    magazine3.category     = [NSSet setWithObjects: category1, nil];
    magazine3.title        = @"Issue #3";
    magazine3.details      = @"Issue #3 Description";
    magazine3.image        = @"Fallout4_AwesomeTales3";
    magazine3.views        = 200;
    magazine3.creationDate = [[NSDate alloc] initWithTimeIntervalSince1970: NSTimeIntervalSince1970];
    
    Magazine* magazine4    = [[Magazine alloc] initWithEntity: description insertIntoManagedObjectContext: self.backgroundManagedObjectContext];
    magazine4.category     = [NSSet setWithObjects: category1, nil];
    magazine4.title        = @"Issue #4";
    magazine4.details      = @"Issue #4 Description";
    magazine4.image        = @"Fallout4_AwesomeTales4";
    magazine4.views        = 123;
    magazine4.creationDate = [[NSDate alloc] initWithTimeIntervalSince1970: NSTimeIntervalSince1970];
    
    Magazine* magazine6    = [[Magazine alloc] initWithEntity: description insertIntoManagedObjectContext: self.backgroundManagedObjectContext];
    magazine6.category     = [NSSet setWithObjects: category1, nil];
    magazine6.title        = @"Issue #6";
    magazine6.details      = @"Issue #6 Description";
    magazine6.image        = @"Fallout4_AwesomeTales6";
    magazine6.views        = 245;
    magazine6.creationDate = [[NSDate alloc] initWithTimeIntervalSince1970: NSTimeIntervalSince1970];
    
    Magazine* magazine8    = [[Magazine alloc] initWithEntity: description insertIntoManagedObjectContext: self.backgroundManagedObjectContext];
    magazine8.category     = [NSSet setWithObjects: category1, nil];
    magazine8.title        = @"Issue #8";
    magazine8.details      = @"Issue #8 Description";
    magazine8.image        = @"Fallout4_AwesomeTales8";
    magazine8.views        = 233;
    magazine8.creationDate = [[NSDate alloc] initWithTimeIntervalSince1970: NSTimeIntervalSince1970];
    
    Magazine* magazine9    = [[Magazine alloc] initWithEntity: description insertIntoManagedObjectContext: self.backgroundManagedObjectContext];
    magazine9.category     = [NSSet setWithObjects: category1, nil];
    magazine9.title        = @"Issue #9";
    magazine9.details      = @"Issue #9 Description";
    magazine9.image        = @"Fallout4_AwesomeTales9";
    magazine9.views        = 3125;
    magazine9.creationDate = [[NSDate alloc] initWithTimeIntervalSince1970: NSTimeIntervalSince1970];
    
    Magazine* magazine10    = [[Magazine alloc] initWithEntity: description insertIntoManagedObjectContext: self.backgroundManagedObjectContext];
    magazine10.category     = [NSSet setWithObjects: category1, nil];
    magazine10.title        = @"Issue #10";
    magazine10.details      = @"Issue #10 Description";
    magazine10.image        = @"Fallout4_AwesomeTales10";
    magazine10.views        = 322;
    magazine10.creationDate = [[NSDate alloc] initWithTimeIntervalSince1970: NSTimeIntervalSince1970];
    
    Magazine* magazine12    = [[Magazine alloc] initWithEntity: description insertIntoManagedObjectContext: self.backgroundManagedObjectContext];
    magazine12.category     = [NSSet setWithObjects: category1, nil];
    magazine12.title        = @"Issue #12";
    magazine12.details      = @"Issue #12 Description";
    magazine12.image        = @"Fallout4_AwesomeTales12";
    magazine12.views        = 777;
    magazine12.creationDate = [[NSDate alloc] initWithTimeIntervalSince1970: NSTimeIntervalSince1970];
    
    [self.coreDataStack saveContext: self.backgroundManagedObjectContext];
}

@end
