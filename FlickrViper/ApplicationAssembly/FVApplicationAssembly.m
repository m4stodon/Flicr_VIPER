
//  RIAssembly.m
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//

#import "FVApplicationAssembly.h"
#import "FVAppDelegate.h"
//
#import "ModuleFactory.h"
//
#import "TabBarModuleAssembly.h"
#import "TabBarModuleViewController.h"
#import "TabBarModulePresenter.h"
//
#import "AuthorizationModuleAssembly.h"
#import "AuthorizationModuleViewController.h"
#import "AuthorizationModulePresenter.h"
//
#import "PhotoCollectionModuleAssembly.h"
#import "PhotoCollectionModuleViewController.h"
#import "PhotoCollectionModulePresenter.h"


@implementation FVApplicationAssembly


//- (instancetype)init {
//    self = [super init];
//    if (self) {
//        NSLog(@"  ---  FVApplicationAssembly instantiated  ---  ");
//    }
//    return self;
//}


- (FVAppDelegate *)appDelegate {
    return [TyphoonDefinition withClass: [FVAppDelegate class]
                          configuration: ^(TyphoonDefinition *definition) {
                              // Inject AppDelegate with root view controller
                              [definition injectProperty: @selector(rootViewController)
                                                    with: [[ModuleFactory openAuthorizationModule] rootViewController]];
                          }];
}


@end
