//
//  TabBarModuleTransitionHandlerProtocol.h
//  FlickrViper
//
//  Created by Yermakov on 17/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


@import Foundation;


@protocol FlickrViperTransitionHandlerProtocol <NSObject>

@optional
- (void)removeModule;
- (void)reloadData;

@end
