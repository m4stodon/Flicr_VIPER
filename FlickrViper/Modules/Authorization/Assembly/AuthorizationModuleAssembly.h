//
//  AuthorizationModuleAssembly.h
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


@import Foundation;
@import Typhoon;

@protocol AuthorizationModuleInput;
@protocol AuthorizationModuleOutput;
@protocol ModuleFactoryProtocol;


@interface AuthorizationModuleAssembly : TyphoonAssembly


- (id<AuthorizationModuleOutput>)assembleAuthorizationModuleWithModuleFactory: (id<ModuleFactoryProtocol>)factory;

@end
