//
//  TabBarViewController.h
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


@import Foundation;
@import UIKit;
#import "SettingsModuleViewInput.h"
#import "FlickrViperTransitionHandlerProtocol.h"


@protocol SettingsModuleViewOutput;


@interface SettingsModuleViewController : UIViewController
<SettingsModuleViewInput, FlickrViperTransitionHandlerProtocol>


@property (nonatomic, strong) id<SettingsModuleViewOutput> output;


@end
