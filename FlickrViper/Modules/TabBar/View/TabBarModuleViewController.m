//
//  TabBarViewController.m
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


#import "TabBarModuleViewController.h"
#import "TabEntity.h"


@implementation TabBarModuleViewController

- (void)viewDidLoad {
    [super viewDidLoad];    
}

- (void)setupTabs: (NSArray<TabEntity*>*)tabs {
    
    NSMutableArray* viewControllers = [[NSMutableArray alloc] init];
    
    // Set View Controllers
    for (TabEntity* tab in tabs) {
        [viewControllers addObject: [tab viewController]];
    }
    [self setViewControllers: viewControllers
                    animated: NO];
    
    // Set TabBarButtons
    for (int index = 0; index < tabs.count; index++) {
        self.tabBar.items[index].title = tabs[index].title;
        self.tabBar.items[index].image = tabs[index].image;
    }
    
    
    // Callback
    [self.output viewSetupCallback: true];
}


@end
