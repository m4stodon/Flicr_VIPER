//
//  TabBarPresenter.m
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


@import UIKit;
#import "PhotoCardDetailsModulePresenter.h"




@implementation PhotoCardDetailsModulePresenter


#pragma mark - PhotoCardDetailsModuleInteractorOutput





#pragma mark - PhotoCardDetailsModuleViewOutput


- (void)viewSetupCallback {
    // Get model from interactor
    // Setup view with this model
    [self.view setupViewWith: [self.interactor getPhotoCardEntity]];
}


#pragma mark - PhotoCardDetailsModuleInput


- (UIViewController *)photoCardDetailsModuleRootViewController {
    return (UIViewController*)self.view;
}

- (void)setupModuleWith:(PhotoCardEntity *)photoCard {
    [self.interactor setPhotoCardEntity: photoCard];
}

@end
