//
//  TabBarInteractor.m
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


#import "PhotoCollectionModuleInteractor.h"
#import "TabEntity.h"
#import "FlickrViperTransitionHandlerProtocol.h"

@interface PhotoCollectionModuleInteractor()

@property (nonatomic, strong) NSArray<TabEntity*>* tabs;

@end

@implementation PhotoCollectionModuleInteractor


- (void)getTabs {
    // instantiate
    NSArray* newTabs = [[NSArray alloc] init];
    
    //[self.output manageNewTabs: newTabs];
}

- (void)openBetaModuleWithExampleString:(NSString*)exampleString {
    
//    [self.moduleFactory instantiatePhotoCollectionModuleWithChainingBlock:
//     ^(id <FlickrViperTransitionHandlerProtocol> sourceModuleTransitionHandler,
//       id <FlickrViperTransitionHandlerProtocol> destinationModuleTransitionHandler) {
//         
//         NSLog(@"opening BetaModule with example string");
//     }];
}


#pragma mark - PhotoCollectionModuleInteractorInput




@end
