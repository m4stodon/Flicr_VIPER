//
//  ModuleFactoryProtocol.h
//  FlickrViper
//
//  Created by Yermakov on 7/10/17.
//  Copyright © 2017 Yermakov. All rights reserved.
//


@import Foundation;


@class ModuleFactory;
@class TabBarModuleAssembly;
@class AuthorizationModuleAssembly;
@class PhotoCollectionModuleAssembly;
@class SettingsModuleAssembly;
@class PhotoCardDetailsModuleAssembly;


@protocol ModuleFactoryProtocol <NSObject>

- (TabBarModuleAssembly*)tabBarModule;
- (AuthorizationModuleAssembly*)authorizationModule;
- (PhotoCollectionModuleAssembly*)photoCollectionModule;
- (PhotoCardDetailsModuleAssembly*)photoCardDetailsModule;
- (SettingsModuleAssembly*)settingsModule;

@end
