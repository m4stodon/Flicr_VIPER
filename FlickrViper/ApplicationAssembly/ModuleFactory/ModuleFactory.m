//
//  ModuleFactory.m
//  FlickrViper
//
//  Created by Yermakov on 7/10/17.
//  Copyright © 2017 Yermakov. All rights reserved.
//


#import "ModuleFactory.h"
#import "AssemblyFactory.h"
//
#import "AuthorizationModuleInput.h"
#import "AuthorizationModuleOutput.h"
#import "AuthorizationModuleAssembly.h"
#import "AuthorizationModulePresenter.h"
//
#import "TabBarModuleInput.h"
#import "TabBarModuleOutput.h"
#import "TabBarModuleAssembly.h"
#import "TabBarModulePresenter.h"
//
#import "PhotoCollectionModuleInput.h"
#import "PhotoCollectionModuleOutput.h"
#import "PhotoCollectionModuleAssembly.h"
#import "PhotoCollectionModulePresenter.h"
//


@implementation ModuleFactory

+ (AssemblyFactory *)assemblyFactory {
    static AssemblyFactory * moduleFactory = nil;
    if (moduleFactory == nil) {
        moduleFactory = [[AssemblyFactory new] activated];
    }
    return moduleFactory;
}


+ (id<AuthorizationModuleInput>)openAuthorizationModule {
    AssemblyFactory* moduleFactory = [[AssemblyFactory new] activated];
    AuthorizationModuleAssembly* authorizationModuleAssembly = [[moduleFactory authorizationModule] activated];
    AuthorizationModulePresenter* authorizationPresenter     = [authorizationModuleAssembly authPresenter];
    return authorizationPresenter;
}

+ (id<TabBarModuleInput>)openTabBarModuleWithOutputHandler: (id<TabBarModuleOutput>)outputHandler {
    AssemblyFactory* moduleFactory = [[AssemblyFactory new] activated];
    TabBarModuleAssembly*  tabBarModuleAssembly  = [[moduleFactory tabBarModule] activated];
    TabBarModulePresenter* tabBarModulePresenter = [tabBarModuleAssembly tabBarPresenter];
    tabBarModulePresenter.output = outputHandler;
    return tabBarModulePresenter;
}

+ (id<PhotoCollectionModuleInput>)openPhotoCollectionModuleWithOutputHandler: (id<PhotoCollectionModuleOutput>)outputHandler {
    AssemblyFactory* moduleFactory = [[AssemblyFactory new] activated];
    PhotoCollectionModuleAssembly*  photoCollectionModuleAssembly  = [[moduleFactory photoCollectionModule] activated];
    PhotoCollectionModulePresenter* photoCollectionModulePresenter = [photoCollectionModuleAssembly photoCollectionPresenter];
    photoCollectionModulePresenter.output = outputHandler;
    return photoCollectionModulePresenter;
}

//+ (id<>)openSettingsModuleWith: (id<>)outputHandler {
//    
//    return id;
//}

@end
