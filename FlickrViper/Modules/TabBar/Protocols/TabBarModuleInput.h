//
//  TabBarModuleInput.h
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


@import UIKit;


@protocol TabBarModuleInput <NSObject>

- (void)addAsTabs: (NSArray<UIViewController*>*) viewControllers;

@end
