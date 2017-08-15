//
//  ModuleFactory.h
//  FlickrViper
//
//  Created by Yermakov on 7/10/17.
//  Copyright © 2017 Yermakov. All rights reserved.
//


@import Foundation;
@import UIKit;


@protocol AuthorizationModuleInput;
@protocol AuthorizationModuleOutput;
@protocol TabBarModuleInput;
@protocol TabBarModuleOutput;
@protocol PhotoCollectionModuleInput;
@protocol PhotoCollectionModuleOutput;
@protocol SettingsModuleInput;
@protocol SettingsModuleOutput;
@protocol PhotoCardDetailsModuleInput;
@protocol PhotoCardDetailsModuleOutput;


@interface ModuleFactory : NSObject

+ (id<AuthorizationModuleInput>)openAuthorizationModule;
+ (id<TabBarModuleInput>)openTabBarModuleWithOutputHandler: (id<TabBarModuleOutput>)outputHandler;
+ (id<PhotoCollectionModuleInput>)openPhotoCollectionModuleWithOutputHandler: (id<PhotoCollectionModuleOutput>)outputHandler;
+ (id<SettingsModuleInput>)openSettingsModuleWith: (id<SettingsModuleOutput>)outputHandler;
+ (id<PhotoCardDetailsModuleInput>)openPhotoCardDetailsModuleWithOutputHandler: (id<PhotoCardDetailsModuleOutput>)outputHandler;

@end
