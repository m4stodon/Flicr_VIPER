//
//  TabBarInteractor.h
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


@import Foundation;
@import UIKit;
#import "TabBarModuleInteractorInput.h"
#import "TabBarModuleInteractorOutput.h"
#import "ModuleFactoryProtocol.h"


@interface TabBarModuleInteractor : NSObject <TabBarModuleInteractorInput>
@property (weak, nonatomic) id<ModuleFactoryProtocol>        moduleFactory;
@property (weak, nonatomic) id<TabBarModuleInteractorOutput> output;
@end
