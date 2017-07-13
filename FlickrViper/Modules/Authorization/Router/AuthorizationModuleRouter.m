//
//  TabBarRouter.m
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


#import "AuthorizationModuleRouter.h"


@import Typhoon;
#import "ModuleFactory.h"
#import "PhotoCollectionModulePresenter.h"


@implementation AuthorizationModuleRouter

- (void)routeToMainAppScreen {
    NSLog(@"[self.transitionHandler moveToMainAppScreen]");
    NSLog(@"%@", self.transitionHandler);
    NSLog(@"%@", self.moduleFactory);
    
    ModuleFactory* moduleFactory = [[ModuleFactory new] activated];
    PhotoCollectionModuleAssembly* photoCollectionModuleAssembly = [[moduleFactory photoCollectionModule] activated];
    PhotoCollectionModulePresenter* photoCollectionPresenter = (PhotoCollectionModulePresenter*)[photoCollectionModuleAssembly assemblePhotoCollectionModuleWithModuleFactory: nil];
    
    UIViewController* destinationVC = photoCollectionPresenter.view;
    
    [self.transitionHandler pushVC: destinationVC];
}


@end
