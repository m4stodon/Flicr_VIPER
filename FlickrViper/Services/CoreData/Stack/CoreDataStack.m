//
//  CoreDataStack.m
//  FlickrViper
//
//  Created by Ermac on 9/3/17.
//  Copyright © 2017 Yermakov. All rights reserved.
//


#import "CoreDataStack.h"


@interface CoreDataStack()
@property (strong, nonatomic) NSPersistentStoreCoordinator* persistentStoreCoordinator;
@property (strong, nonatomic) NSManagedObjectContext* mainManagedObjectContext;
@property (strong, nonatomic) NSManagedObjectContext* backgroundManagedObjectContext;
@property (strong, nonatomic) NSManagedObjectModel* managedObjectModel;
@end

@implementation CoreDataStack

NSString* const databaseName     = @"DataBase";
NSString* const databaseFileName = @"DataBase.sqlite";


#pragma mark - Lifecycle


- (instancetype)init {
    if(self = [super init]) {
        [self setupDatabase];
    }
    return self;
}

- (void) setupDatabase {
    [self setupManagedObjectModel];
    [self setupPeristentStore];
    [self setupManagedObjectContext];
}

- (NSURL*)applicationDocumentsDirectory {
    return [[[NSFileManager defaultManager] URLsForDirectory: NSDocumentDirectory inDomains: NSUserDomainMask] lastObject];
}

- (void)setupManagedObjectModel {
    NSURL* modeUrl  = [[NSBundle mainBundle] URLForResource: databaseName
                                              withExtension: @"momd"];
    self.managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL: modeUrl];
}

- (void)setupPeristentStore {
    NSError* error;
    NSURL* storeUrl = [[self applicationDocumentsDirectory] URLByAppendingPathComponent: databaseFileName];
    self.persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel: self.managedObjectModel];
    [self.persistentStoreCoordinator addPersistentStoreWithType: NSSQLiteStoreType
                                                  configuration: nil
                                                            URL: storeUrl
                                                        options: nil
                                                          error: &error];
    if (error)
    { NSLog(@"error: %@", error); }
}

- (void)setupManagedObjectContext {
    self.mainManagedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType: NSMainQueueConcurrencyType];
    self.mainManagedObjectContext.undoManager = [[NSUndoManager alloc] init];
    self.mainManagedObjectContext.mergePolicy = NSOverwriteMergePolicy;
    self.mainManagedObjectContext.persistentStoreCoordinator = self.persistentStoreCoordinator;
    //
    self.backgroundManagedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType: NSPrivateQueueConcurrencyType];
    self.backgroundManagedObjectContext.undoManager = [[NSUndoManager alloc] init];
    self.backgroundManagedObjectContext.mergePolicy = NSOverwriteMergePolicy;
    self.backgroundManagedObjectContext.parentContext = self.mainManagedObjectContext;
}


#pragma mark - Actions


- (NSManagedObjectContext*)createNewMainDatabaseContext {
    NSManagedObjectContext* context = [[NSManagedObjectContext alloc] initWithConcurrencyType: NSMainQueueConcurrencyType];
    context.undoManager   = nil;
    context.mergePolicy   = NSOverwriteMergePolicy;
    context.parentContext = self.mainManagedObjectContext;
    return context;
}

- (NSManagedObjectContext*)createNewBackgroundDatabaseContext {
    NSManagedObjectContext* context = [[NSManagedObjectContext alloc] initWithConcurrencyType: NSPrivateQueueConcurrencyType];
    context.parentContext = self.backgroundManagedObjectContext;
    return context;
}

- (NSManagedObjectContext*)getMainContext {
    return  self.mainManagedObjectContext;
}

- (void)saveMainContext {
    [self saveContext: self.mainManagedObjectContext];
}

- (void)saveContext: (NSManagedObjectContext*)context {
    NSError* error = nil;
    [self saveDatabaseForContext: context error: error];
}

- (void)saveDatabaseForContext: (NSManagedObjectContext*)context error: (NSError*)error {
    if (!self.persistentStoreCoordinator)
    { return; }
    NSManagedObjectContext* __strong strongContext = context;
    [strongContext performBlockAndWait: ^{
        NSError* saveError = nil;
        if ([strongContext save: &saveError]) {
            NSManagedObjectContext* parentContext = strongContext.parentContext;
            if (parentContext) {
                [parentContext performBlockAndWait: ^{
                    NSError* parentSaveError = nil;
                    [self saveDatabaseForContext: parentContext error: parentSaveError];
                    if (parentSaveError)
                    {  NSLog(@"Context save error"); }
                }];
            }
        }
    }];
}

- (void)resetCoreData {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error = nil;
    NSArray *directoryContents = [fileManager contentsOfDirectoryAtPath: [[self applicationDocumentsDirectory] path] error:&error];
    if (error == nil) {
        for (NSString *path in directoryContents) {
            if ([path containsString: databaseFileName]) {
                NSString *fullPath = [[[self applicationDocumentsDirectory] path] stringByAppendingPathComponent: path];
                BOOL removeSuccess = [fileManager removeItemAtPath:fullPath error:&error];
                if (!removeSuccess) {
                    NSLog(@"resetCoreData failed");
                }
            }
        }
    } else {
        NSLog(@"resetCoreData failed");
    }
    
    self.mainManagedObjectContext   = nil;
    self.persistentStoreCoordinator = nil;
    
    [self setupDatabase];
}

@end
