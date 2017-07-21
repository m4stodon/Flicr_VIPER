//
//  TabBarRouter.m
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


#import "AuthorizationModuleRouter.h"

@import UIKit;
@import Typhoon;

#import "PhotoCollectionModulePresenter.h"
#import "ModuleFactory.h"

#import <objc/runtime.h>


@implementation AuthorizationModuleRouter

- (void)routeToMainAppScreen {    
    // Activate module assembly to factorize the modules
    id moduleFactoryAccessor = ((ModuleFactory*)self.moduleFactory).activated;
    // Factorize module and activate
    PhotoCollectionModuleAssembly*  photoCollectionModuleAssembly = [[moduleFactoryAccessor photoCollectionModule] activated];
    // Get module view
    PhotoCollectionModulePresenter* photoCollectionPresenter      = [photoCollectionModuleAssembly photoCollectionPresenter];
    
    UIViewController* destinationVC = photoCollectionPresenter.view;
    // Route to the view
    [self.transitionHandler pushVC: destinationVC];
}


@end
