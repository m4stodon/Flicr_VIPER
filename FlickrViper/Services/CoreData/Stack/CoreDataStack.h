//
//  CoreDataStack.h
//  FlickrViper
//
//  Created by Ermac on 9/3/17.
//  Copyright © 2017 Yermakov. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreData;

@interface CoreDataStack: NSObject
- (NSManagedObjectContext*)createNewMainDatabaseContext;
- (NSManagedObjectContext*)createNewBackgroundDatabaseContext;
- (NSManagedObjectContext*)getMainContext;
- (void)saveMainContext;
- (void)saveContext: (NSManagedObjectContext*)context;
- (void)resetCoreData;
@end
