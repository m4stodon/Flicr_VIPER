//
//  AuthorizationModuleAssembly.h
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


@import Foundation;
@import Typhoon;

@class AuthorizationModulePresenter;


@interface AuthorizationModuleAssembly : TyphoonAssembly
- (AuthorizationModulePresenter*)authPresenter;
@end
