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
#import "SettingsModuleInput.h"
#import "SettingsModuleOutput.h"
#import "SettingsModuleAssembly.h"
#import "SettingsModulePresenter.h"
//
#import "PhotoCardDetailsModuleInput.h"
#import "PhotoCardDetailsModuleOutput.h"
#import "PhotoCardDetailsModuleAssembly.h"
#import "PhotoCardDetailsModulePresenter.h"
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

+ (id<PhotoCardDetailsModuleInput>)openPhotoCardDetailsModuleWithOutputHandler:(id<PhotoCardDetailsModuleOutput>)outputHandler {
    AssemblyFactory* moduleFactory = [[AssemblyFactory new] activated];
    PhotoCardDetailsModuleAssembly*  photoCardDetailsModuleAssembly  = [[moduleFactory photoCardDetailsModule] activated];
    PhotoCardDetailsModulePresenter* photoCardDetailsModulePresenter = [photoCardDetailsModuleAssembly photoCardDetailsPresenter];
    photoCardDetailsModulePresenter.output = outputHandler;
    return photoCardDetailsModulePresenter;
}

+ (id<SettingsModuleInput>)openSettingsModuleWith: (id<SettingsModuleOutput>)outputHandler {
    AssemblyFactory* moduleFactory = [[AssemblyFactory new] activated];
    SettingsModuleAssembly*  settingsModuleAssembly  = [[moduleFactory settingsModule] activated];
    SettingsModulePresenter* settingsModulePresenter = [settingsModuleAssembly settingsPresenter];
    settingsModulePresenter.output = outputHandler;
    return settingsModulePresenter;
}

@end
