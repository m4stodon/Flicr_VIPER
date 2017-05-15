//
//  AppDelegate.h
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FVStartUpConfigurator;
@protocol FVStartUpConfiguratorDelegate;



@interface FVAppDelegate : UIResponder <UIApplicationDelegate>


@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) id <FVStartUpConfiguratorDelegate> startUpConfigurator;


@end

