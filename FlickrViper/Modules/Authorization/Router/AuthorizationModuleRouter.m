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
    NSLog(@"[self.transitionHandler moveToMainAppScreen]");
    NSLog(@"%@", self.transitionHandler);
    NSLog(@"%@", self.moduleFactory);
    
//    id moduleFactoryAccessor = ((ModuleFactory*)self.moduleFactory).accessor;
//    [self showMethodsFor: moduleFactoryAccessor];
    
    ModuleFactory* moduleFactoryAccessor = [[ModuleFactory new] activated];
    
    PhotoCollectionModuleAssembly* photoCollectionModuleAssembly = [[moduleFactoryAccessor photoCollectionModule] activated];
    PhotoCollectionModulePresenter* photoCollectionPresenter     = [photoCollectionModuleAssembly photoCollectionPresenter];
    UIViewController* destinationVC = photoCollectionPresenter.view;
    [self.transitionHandler pushVC: destinationVC];
}

- (void)showMethodsFor: (id)object{
    int i=0;
    unsigned int mc = 0;
    Method * mlist = class_copyMethodList(object_getClass(object), &mc);
    NSLog(@"%d methods", mc);
    for(i=0; i<mc; i++) {
        NSLog(@"Method no #%d: %s", i, sel_getName(method_getName(mlist[i])));
    }
}


@end
