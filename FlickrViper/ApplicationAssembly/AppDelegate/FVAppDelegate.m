//
//  AppDelegate.m
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


#import "FVAppDelegate.h"
#import "FVApplicationAssembly.h"


@implementation FVAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame: UIScreen.mainScreen.bounds];
    if (self.rootViewController == nil) {
        self.rootViewController = [[UIViewController alloc] init];
    }
    self.window.rootViewController = self.rootViewController;
    return YES;
}


@end
