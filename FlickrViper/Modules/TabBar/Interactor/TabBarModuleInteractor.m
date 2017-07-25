//
//  TabBarInteractor.m
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


#import "TabBarModuleInteractor.h"
#import "TabEntity.h"
#import "FlickrViperTransitionHandlerProtocol.h"

@interface TabBarModuleInteractor()

@property (nonatomic, strong) NSArray<TabEntity*>* tabs;

@end

@implementation TabBarModuleInteractor


#pragma mark - TabBarModuleInteractorInput


- (void)makeTabsWithControllers: (NSArray<UIViewController*>*)controllers {
    
    TabEntity* tab = [[TabEntity alloc] init];
    tab.viewController = controllers[0];
    tab.title = @"Feed";
    tab.image = [UIImage imageNamed: @"NewsTab"];
    tab.tabIndex = 1;
    
    TabEntity* tab2 = [[TabEntity alloc] init];
    tab2.viewController = controllers[1];
    tab2.title = @"Settings";
    tab2.image = [UIImage imageNamed: @"SettingsTab"];
    tab2.tabIndex = 2;
    
    [self.output manageNewTabs: [[NSArray alloc] initWithObjects: tab, tab2, nil]];
}







@end
