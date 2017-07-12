
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



@interface FVApplicationAssembly()



@end


@implementation FVApplicationAssembly


- (FVAppDelegate *)appDelegate {
    return [TyphoonDefinition withClass: [FVAppDelegate class]
                          configuration: ^(TyphoonDefinition *definition)
            {
                
                
                // Init module factory
                ModuleFactory* moduleFactory = [ModuleFactory new];
                moduleFactory = [moduleFactory activated];
                
                
                // Init modules assemblies
                TabBarModuleAssembly*          tabBarModuleAssembly          = [[moduleFactory tabBarModule] activated];
                AuthorizationModuleAssembly*   authorizationModuleAssembly   = [[moduleFactory authorizationModule] activated];
                PhotoCollectionModuleAssembly* photoCollectionModuleAssembly = [[moduleFactory photoCollectionModule] activated];
                
                // Assemble modules
                TabBarModulePresenter* tabBarPresenter = (TabBarModulePresenter*)[tabBarModuleAssembly assembleTabBarModuleWithModuleFactory: nil];
                AuthorizationModulePresenter* authorizationPresenter = (AuthorizationModulePresenter*)[authorizationModuleAssembly assembleAuthorizationModuleWithModuleFactory: nil];
                PhotoCollectionModulePresenter* photoCollectionPresenter = (PhotoCollectionModulePresenter*)[photoCollectionModuleAssembly assemblePhotoCollectionModuleWithModuleFactory: nil];
                
                
                // Add Modules views to TabBarViewController
                NSMutableArray* viewControllers = [[NSMutableArray alloc] init];
                [viewControllers addObject: authorizationPresenter.view];
                [viewControllers addObject: photoCollectionPresenter.view];
                [tabBarPresenter addAsTabs: viewControllers];
                
                
                // Inject AppDelegate
                [definition injectProperty: @selector(rootViewController)
                                      with: tabBarPresenter.view];
            }];
}




@end
