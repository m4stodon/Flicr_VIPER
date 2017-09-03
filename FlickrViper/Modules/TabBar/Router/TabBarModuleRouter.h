//
//  TabBarRouter.h
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


@import Foundation;
#import "TabBarModuleRouterInput.h"
#import "FlickrViperTransitionHandlerProtocol.h"


@interface TabBarModuleRouter : NSObject <TabBarModuleRouterInput>
@property (nonatomic, weak) id<FlickrViperTransitionHandlerProtocol> transitionHandler;
@end
