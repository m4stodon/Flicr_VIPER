//
//  TabBarPresenter.m
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


@import UIKit;
@class PhotoCardEntity;
#import "PhotoCollectionModulePresenter.h"


@implementation PhotoCollectionModulePresenter


#pragma mark - PhotoCollectionModuleInteractorOutput





#pragma mark - PhotoCollectionModuleViewOutput


- (void)viewSetupCallback {
    
}

- (void)didSelectItem:(PhotoCardEntity *)item {
    [self.router showDetailsFor: item];
}


#pragma mark - PhotoCollectionModuleInput


- (UIViewController *)photoCollectionModuleRootViewController {
    return (UIViewController*)self.view;
}

@end
