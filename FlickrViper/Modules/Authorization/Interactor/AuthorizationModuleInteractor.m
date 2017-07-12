//
//  TabBarInteractor.m
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


#import "AuthorizationModuleInteractor.h"
#import "TabEntity.h"
#import "FlickrViperTransitionHandlerProtocol.h"

@interface AuthorizationModuleInteractor()

@property (nonatomic, strong) NSArray<TabEntity*>* tabs;

@end

@implementation AuthorizationModuleInteractor


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


#pragma mark - AuthorizationModuleInteractorInput




@end
