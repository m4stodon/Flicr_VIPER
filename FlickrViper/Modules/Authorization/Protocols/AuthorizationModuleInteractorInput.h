//
//  TabBarInteractorInput.h
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


@import Foundation;


@protocol AuthorizationModuleInteractorInput <NSObject>

- (void)checkCredentials: (NSString*)login password: (NSString*)password;

@end
