//
//  TabBarViewController.h
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


@import Foundation;
@import UIKit;
#import "AuthorizationModuleViewInput.h"
#import "FlickrViperTransitionHandlerProtocol.h"
#import "AuthorizationModuleViewOutput.h"


@interface AuthorizationModuleViewController : UIViewController <AuthorizationModuleViewInput, FlickrViperTransitionHandlerProtocol>
@property (nonatomic, strong) id<AuthorizationModuleViewOutput> output;
@end
