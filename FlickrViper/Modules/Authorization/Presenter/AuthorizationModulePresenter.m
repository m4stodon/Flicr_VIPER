//
//  TabBarPresenter.m
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


@import UIKit;
#import "AuthorizationModulePresenter.h"
#import "ModuleFactoryProtocol.h"


@implementation AuthorizationModulePresenter


#pragma mark - AuthorizationModuleInteractorOutput


- (void)loginSuccess: (BOOL)result {
    
    [self.view stopProcessing];
    
    if (result) {
        NSLog(@"LOGIN SUCCESS");
        [self.router routeToMainAppScreen];
    } else {
        NSLog(@"LOGIN FAILED");
    }
}


#pragma mark - AuthorizationModuleViewOutput


- (void)loginWithCredentials: (NSString*)login password: (NSString*)password {
    [self.view startProcessing];
    [self.interactor checkCredentials: login password: password];
}


#pragma mark - AuthorizationModuleInput


- (UIViewController*)rootViewController {
    return (UIViewController*)self.view;
}


#pragma mark - AuthorizationModuleOutput


@end
