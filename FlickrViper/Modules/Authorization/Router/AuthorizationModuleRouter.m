//
//  TabBarRouter.m
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


#import "AuthorizationModuleRouter.h"
#import "PhotoCollectionModulePresenter.h"
#import "ModuleFactory.h"

#import "TabBarModuleInput.h"
#import "TabBarModuleOutput.h"

#import "PhotoCollectionModuleInput.h"
#import "PhotoCollectionModuleOutput.h"


@interface AuthorizationModuleRouter() <TabBarModuleOutput>

@property (strong, nonatomic) id<TabBarModuleInput> tabBarModule;

@end


@implementation AuthorizationModuleRouter


- (void)routeToMainAppScreen {
    // Setup tabBar
    self.tabBarModule = [ModuleFactory openTabBarModuleWithOutputHandler: self];
    // Setup tabs for module
    id<PhotoCollectionModuleInput> photoCollectionModule = [ModuleFactory openPhotoCollectionModuleWithOutputHandler: nil];
    UIViewController* photoCollectionViewController = [photoCollectionModule photoCollectionModuleRootViewController];
    [self.tabBarModule addAsTabs: [NSArray arrayWithObject: photoCollectionViewController]];
}


#pragma mark - TabBarModuleOutput


- (void)tabBarModuleRootViewController:(UIViewController *)viewController {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.transitionHandler pushVC: viewController];
    });
}

@end
