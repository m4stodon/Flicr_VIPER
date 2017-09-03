//
//  TabBarInteractor.m
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


#import "PhotoCollectionModuleInteractor.h"
#import "CoreDataService.h"
#import "PhotoCardEntity.h"
#import "Magazine+CoreDataProperties.h"


@implementation PhotoCollectionModuleInteractor

- (void)fetchData {
    //[[CoreDataService sharedManager] fillTheDatabase];
    NSArray* magazines = [[CoreDataService sharedManager] fetchMagazines];
    NSMutableArray<PhotoCardEntity*>* photoCards = [NSMutableArray new];
    
    for (Magazine* magazine in magazines) {
        [photoCards addObject: [[PhotoCardEntity alloc] initWith: [UIImage imageNamed: magazine.image] text: magazine.title descriptionText: magazine.details]];
    }
    [self.output handle: photoCards];
}



@end
