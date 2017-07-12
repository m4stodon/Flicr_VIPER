//
//  TabBarPresenter.m
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


@import UIKit;
#import "AuthorizationModulePresenter.h"


@implementation AuthorizationModulePresenter


#pragma mark - AuthorizationModuleInteractorOutput
// Output from interactor

- (void)manageNewTabs: (NSArray *)tabs {
    [self.view setupTabs: tabs];
}


#pragma mark - AuthorizationModuleViewOutput
// Output from view

- (void)setupView {
    [self.interactor getTabs];
}


#pragma mark - AuthorizationModuleOutput
// Output from module



#pragma mark - AuthorizationModuleOutput
// Input to this module

- (UIViewController*)rootViewController {
    // cast to supress de warnin'
    return (UIViewController *)self.view;
}


@end
