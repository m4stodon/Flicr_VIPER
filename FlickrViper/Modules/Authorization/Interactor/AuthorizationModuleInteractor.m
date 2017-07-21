//
//  TabBarInteractor.m
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


#import "AuthorizationModuleInteractor.h"
#import "TabEntity.h"
#import "FlickrViperTransitionHandlerProtocol.h"


@implementation AuthorizationModuleInteractor


#pragma mark - AuthorizationModuleInteractorInput


- (void)checkCredentials: (NSString*)login password: (NSString*)password {
    
    // simulating network use
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        sleep(1); // sleep for 1 sec
        BOOL result = true;
        
        if (![login isEqualToString: @"abc"]) {
            result = false;
        }
        
        if (![password isEqualToString: @"1"]) {
            result = false;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.output loginSuccess: result];
        });
    });
}

@end
