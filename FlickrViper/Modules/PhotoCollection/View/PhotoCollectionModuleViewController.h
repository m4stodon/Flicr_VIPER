//
//  TabBarViewController.h
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


@import Foundation;
@import UIKit;
#import "PhotoCollectionModuleViewInput.h"
#import "FlickrViperTransitionHandlerProtocol.h"


@protocol PhotoCollectionModuleViewOutput;


@interface PhotoCollectionModuleViewController : UIViewController <PhotoCollectionModuleViewInput, FlickrViperTransitionHandlerProtocol>

@property (nonatomic, strong) id<PhotoCollectionModuleViewOutput> output;

@end
