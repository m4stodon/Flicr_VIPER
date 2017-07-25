//
//  TabBarRouter.h
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


@import Foundation;
@import UIKit;
@import Typhoon;

#import "AuthorizationModuleRouterInput.h"
#import "FlickrViperTransitionHandlerProtocol.h"
#import "ModuleFactoryProtocol.h"


@interface AuthorizationModuleRouter : NSObject <AuthorizationModuleRouterInput>

// STRONG REFERENCE on the view
@property (nonatomic, strong) id<FlickrViperTransitionHandlerProtocol> transitionHandler;
@property (nonatomic, strong) id<ModuleFactoryProtocol> moduleFactory;

@end
