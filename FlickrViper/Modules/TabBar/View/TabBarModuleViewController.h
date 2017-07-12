//
//  TabBarViewController.h
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


@import Foundation;
@import UIKit;
#import "TabBarModuleViewInput.h"
#import "FlickrViperTransitionHandlerProtocol.h"


@protocol TabBarModuleViewOutput;


@interface TabBarModuleViewController : UITabBarController <TabBarModuleViewInput, FlickrViperTransitionHandlerProtocol>

@property (nonatomic, strong) id<TabBarModuleViewOutput> output;

@end
