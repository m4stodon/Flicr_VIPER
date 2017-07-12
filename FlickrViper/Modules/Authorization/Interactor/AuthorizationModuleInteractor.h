//
//  TabBarInteractor.h
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


@import Foundation;
@import UIKit;
#import "AuthorizationModuleInteractorInput.h"
#import "AuthorizationModuleInteractorOutput.h"
#import "ModuleFactoryProtocol.h"


@interface AuthorizationModuleInteractor : NSObject <AuthorizationModuleInteractorInput>

@property (weak, nonatomic)   id<ModuleFactoryProtocol>        moduleFactory;
@property (strong, nonatomic) id<AuthorizationModuleInteractorOutput> output;

@end
