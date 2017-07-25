//
//  TabBarPresenter.h
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


@import Foundation;
#import "SettingsModuleInput.h"
#import "SettingsModuleOutput.h"
#import "SettingsModuleViewInput.h"
#import "SettingsModuleViewOutput.h"
#import "SettingsModuleRouterInput.h"
#import "SettingsModuleInteractorInput.h"
#import "SettingsModuleInteractorOutput.h"



@interface SettingsModulePresenter: NSObject
<SettingsModuleInput, SettingsModuleInteractorOutput, SettingsModuleViewOutput>


@property (nonatomic, weak)   id<SettingsModuleViewInput>       view;
@property (nonatomic, strong) id<SettingsModuleInteractorInput> interactor;
@property (nonatomic, strong) id<SettingsModuleRouterInput>     router;
@property (nonatomic, strong) id<SettingsModuleOutput>          output;


@end
