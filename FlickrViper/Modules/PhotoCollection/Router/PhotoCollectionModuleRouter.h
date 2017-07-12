//
//  TabBarRouter.h
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


@import Foundation;
#import "PhotoCollectionModuleRouterInput.h"
#import "FlickrViperTransitionHandlerProtocol.h"


@interface PhotoCollectionModuleRouter : NSObject <PhotoCollectionModuleRouterInput>

@property (nonatomic, weak) id<FlickrViperTransitionHandlerProtocol> transitionHandler;

@end
