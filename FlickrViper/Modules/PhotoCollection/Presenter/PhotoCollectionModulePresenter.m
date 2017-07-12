//
//  TabBarPresenter.m
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


@import UIKit;
#import "PhotoCollectionModulePresenter.h"


@implementation PhotoCollectionModulePresenter


#pragma mark - PhotoCollectionModuleInteractorOutput
// Output from interactor

- (void)manageNewTabs: (NSArray *)tabs {
    [self.view setupTabs: tabs];
}


#pragma mark - PhotoCollectionModuleViewOutput
// Output from view

- (void)setupView {
    [self.interactor getTabs];
}


#pragma mark - PhotoCollectionModuleOutput
// Output from module



#pragma mark - PhotoCollectionModuleOutput
// Input to this module

- (UIViewController*)rootViewController {
    // cast to supress de warnin'
    return (UIViewController *)self.view;
}


@end
