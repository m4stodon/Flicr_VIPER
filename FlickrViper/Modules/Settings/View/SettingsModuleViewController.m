//
//  TabBarViewController.m
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


#import "SettingsModuleViewController.h"
#import "SettingsModuleViewOutput.h"
#import "TabEntity.h"


@interface SettingsModuleViewController()

@property (weak, nonatomic) IBOutlet UIImageView *avatar;

@property (weak, nonatomic) IBOutlet UISwitch *notificationsSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *presenceSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *cacheSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *wifiOnlySwitch;

@end

@implementation SettingsModuleViewController


- (void)viewDidLoad {
    [super viewDidLoad];
}




@end
