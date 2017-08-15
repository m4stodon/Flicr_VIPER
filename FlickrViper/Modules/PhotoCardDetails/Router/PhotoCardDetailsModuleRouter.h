//
//  TabBarRouter.h
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


@import Foundation;
#import "PhotoCardDetailsModuleRouterInput.h"
#import "FlickrViperTransitionHandlerProtocol.h"


@interface PhotoCardDetailsModuleRouter : NSObject <PhotoCardDetailsModuleRouterInput>

@property (nonatomic, weak) id<FlickrViperTransitionHandlerProtocol> transitionHandler;

@end
