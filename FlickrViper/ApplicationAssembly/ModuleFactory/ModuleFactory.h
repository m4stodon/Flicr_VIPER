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

@interface ModuleFactory : NSObject

+ (id<AuthorizationModuleInput>)openAuthorizationModule;
+ (id<TabBarModuleInput>)openTabBarModuleWithOutputHandler: (id<TabBarModuleOutput>)outputHandler;
+ (id<PhotoCollectionModuleInput>)openPhotoCollectionModuleWithOutputHandler: (id<PhotoCollectionModuleOutput>)outputHandler;
//+ (UIViewController*)openSettingsModuleWith: (id)outputHandler;

@end
