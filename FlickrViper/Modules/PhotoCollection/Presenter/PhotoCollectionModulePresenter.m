//
//  TabBarPresenter.m
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


@import UIKit;
#import "PhotoCardEntity.h"
#import "PhotoCollectionModulePresenter.h"


@implementation PhotoCollectionModulePresenter


#pragma mark - PhotoCollectionModuleInteractorOutput


- (void)handle: (NSArray<PhotoCardEntity *> *)photoCards {
    [self.view show: photoCards];
}


#pragma mark - PhotoCollectionModuleViewOutput


- (void)viewSetupCallback {
    [self.interactor fetchData];
}

- (void)didSelectItem:(PhotoCardEntity *)item {
    [self.router showDetailsFor: item];
}


#pragma mark - PhotoCollectionModuleInput


- (UIViewController *)photoCollectionModuleRootViewController {
    return (UIViewController*)self.view;
}

@end
