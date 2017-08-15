//
//  TabBarRouter.m
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


#import "PhotoCollectionModuleRouter.h"
#import "ModuleFactory.h"
#import "PhotoCardDetailsModuleInput.h"
#import "PhotoCardDetailsModuleOutput.h"


@implementation PhotoCollectionModuleRouter

- (void)showDetailsFor:(PhotoCardEntity *)photoCard {
    
    id<PhotoCardDetailsModuleInput> photoCardDetailModule = [ModuleFactory openPhotoCardDetailsModuleWithOutputHandler: nil];
    [photoCardDetailModule setupModuleWith: photoCard];
    UIViewController* photoCardDetailViewController = [photoCardDetailModule photoCardDetailsModuleRootViewController];
    UINavigationController* navigationContainer = [[UINavigationController alloc] initWithRootViewController: photoCardDetailViewController];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.transitionHandler pushVC: navigationContainer];
    });
}


@end
