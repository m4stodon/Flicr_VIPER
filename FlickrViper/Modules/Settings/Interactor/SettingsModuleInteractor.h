//
//  TabBarInteractor.h
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


@import Foundation;
@import UIKit;
#import "SettingsModuleInteractorInput.h"
#import "SettingsModuleInteractorOutput.h"
#import "ModuleFactoryProtocol.h"


@interface SettingsModuleInteractor : NSObject <SettingsModuleInteractorInput>

@property (weak, nonatomic)   id<ModuleFactoryProtocol>        moduleFactory;
@property (strong, nonatomic) id<SettingsModuleInteractorOutput> output;

@end
