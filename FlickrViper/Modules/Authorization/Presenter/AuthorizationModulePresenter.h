//
//  TabBarPresenter.h
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


@import Foundation;
#import "AuthorizationModuleInput.h"
#import "AuthorizationModuleOutput.h"
#import "AuthorizationModuleViewInput.h"
#import "AuthorizationModuleViewOutput.h"
#import "AuthorizationModuleRouterInput.h"
#import "AuthorizationModuleInteractorInput.h"
#import "AuthorizationModuleInteractorOutput.h"



@interface AuthorizationModulePresenter: NSObject <AuthorizationModuleInput, AuthorizationModuleInteractorOutput, AuthorizationModuleViewOutput>
@property (nonatomic, weak)   id<AuthorizationModuleViewInput>       view;
@property (nonatomic, strong) id<AuthorizationModuleInteractorInput> interactor;
@property (nonatomic, strong) id<AuthorizationModuleRouterInput>     router;
@end
