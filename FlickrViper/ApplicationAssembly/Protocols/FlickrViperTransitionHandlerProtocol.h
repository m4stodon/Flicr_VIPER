//
//  TabBarModuleTransitionHandlerProtocol.h
//  FlickrViper
//
//  Created by Yermakov on 17/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


@import Foundation;


#import "TabBarModuleInput.h"
#import "AuthorizationModuleOutput.h"





@protocol FlickrViperModuleFactoryProtocol <NSObject>


@end





@protocol FlickrViperTransitionHandlerProtocol <NSObject>

- (void)pushVC: (UIViewController*)viewController;

- (void)openModuleUsingFactory: (id<FlickrViperModuleFactoryProtocol>)factory
           withTransitionBlock: (void (^)(id <FlickrViperTransitionHandlerProtocol> sourceModuleTransitionHandler, id <FlickrViperTransitionHandlerProtocol> destinationModuleTransitionHandler))transitionBlock
           thenChainUsingBlock: (id<AuthorizationModuleOutput>(^)(id<TabBarModuleInput> moduleInput))chainBlock;



@optional
- (void)removeModule;
- (void)reloadData;

@end
