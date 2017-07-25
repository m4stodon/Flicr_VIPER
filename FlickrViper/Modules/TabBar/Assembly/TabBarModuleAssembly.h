//
//  TabBarModuleAssembly.h
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


@import Foundation;
@import Typhoon;

@protocol TabBarModuleInput;
@protocol TabBarModuleOutput;
@protocol ModuleFactoryProtocol;
@class TabBarModulePresenter;


@interface TabBarModuleAssembly : TyphoonAssembly


- (TabBarModulePresenter*)tabBarPresenter;


@end
