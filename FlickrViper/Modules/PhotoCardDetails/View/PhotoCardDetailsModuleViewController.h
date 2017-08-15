//
//  TabBarViewController.h
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


@import Foundation;
@import UIKit;
#import "PhotoCardDetailsModuleViewInput.h"
#import "FlickrViperTransitionHandlerProtocol.h"


@protocol PhotoCardDetailsModuleViewOutput;


@interface PhotoCardDetailsModuleViewController : UIViewController
<PhotoCardDetailsModuleViewInput, FlickrViperTransitionHandlerProtocol>

@property (nonatomic, strong) id<PhotoCardDetailsModuleViewOutput> output;

@end
