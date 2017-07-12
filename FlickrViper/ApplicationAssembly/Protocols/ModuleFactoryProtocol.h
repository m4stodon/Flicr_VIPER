//
//  ModuleFactoryProtocol.h
//  FlickrViper
//
//  Created by Yermakov on 7/10/17.
//  Copyright © 2017 Yermakov. All rights reserved.
//


@import Foundation;


@class TabBarModuleAssembly;


@protocol ModuleFactoryProtocol <NSObject>


+ (TabBarModuleAssembly*)getTabBarAssembly;


@end
