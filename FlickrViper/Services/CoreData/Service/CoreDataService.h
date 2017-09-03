//
//  CoreDataService.h
//  FlickrViper
//
//  Created by Ermac on 9/3/17.
//  Copyright © 2017 Yermakov. All rights reserved.
//


@import Foundation;
@import CoreData;


@interface CoreDataService : NSObject

+ (instancetype)sharedManager;
- (NSFetchedResultsController*)createNewFetchResultsControllerForEntityWithName: (NSString*)name sortDescriptior: (NSSortDescriptor*)sortDescriptor;
- (void)fillTheDatabase;
- (NSArray*)fetchMagazines;

@end
