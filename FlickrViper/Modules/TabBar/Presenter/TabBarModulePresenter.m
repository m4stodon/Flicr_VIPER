//
//  TabBarPresenter.m
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


@import UIKit;
#import "TabBarModulePresenter.h"
#import "TabEntity.h"

@implementation TabBarModulePresenter


#pragma mark - TabBarModuleInteractorOutput


- (void)manageNewTabs: (NSArray<id<TabEntity>>*)tabs {
    [self.view setupTabs: tabs];
}


#pragma mark - TabBarModuleViewOutput


- (void)viewSetupCallback: (BOOL)successfull {    
    if (successfull) {
        [self.moduleOutput rootViewController: (UIViewController*)self.view];
    }
}


#pragma mark - TabBarModuleInput


- (void)addAsTabs:(NSArray<UIViewController *> *)viewControllers {
    [self.interactor makeTabsWithControllers: viewControllers];
}


@end
