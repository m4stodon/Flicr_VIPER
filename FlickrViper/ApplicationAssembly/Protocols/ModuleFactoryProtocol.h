//
//  ModuleFactoryProtocol.h
//  FlickrViper
//
//  Created by Yermakov on 7/10/17.
//  Copyright © 2017 Yermakov. All rights reserved.
//


@import Foundation;


@class TabBarModuleAssembly;
@class AuthorizationModuleAssembly;
@class PhotoCollectionModuleAssembly;


@protocol ModuleFactoryProtocol <NSObject>

- (TabBarModuleAssembly*)tabBarModule;
- (AuthorizationModuleAssembly*)authorizationModule;
- (PhotoCollectionModuleAssembly*)photoCollectionModule;

@end
