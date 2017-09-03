//
//  TabBarPresenter.h
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


@import Foundation;
#import "TabBarModuleInput.h"
#import "TabBarModuleOutput.h"
#import "TabBarModuleViewInput.h"
#import "TabBarModuleViewOutput.h"
#import "TabBarModuleRouterInput.h"
#import "TabBarModuleInteractorInput.h"
#import "TabBarModuleInteractorOutput.h"


@interface TabBarModulePresenter: NSObject <TabBarModuleInput, TabBarModuleInteractorOutput, TabBarModuleViewOutput>
@property (nonatomic, weak)   id<TabBarModuleViewInput>       view;
@property (nonatomic, strong) id<TabBarModuleInteractorInput> interactor;
@property (nonatomic, strong) id<TabBarModuleRouterInput>     router;
@property (nonatomic, strong) id<TabBarModuleOutput>          output;
@end
