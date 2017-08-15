//
//  TabBarInteractor.h
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


@import Foundation;
@import UIKit;
#import "PhotoCardDetailsModuleInteractorInput.h"
#import "PhotoCardDetailsModuleInteractorOutput.h"
#import "ModuleFactoryProtocol.h"


@interface PhotoCardDetailsModuleInteractor : NSObject <PhotoCardDetailsModuleInteractorInput>

@property (strong, nonatomic) id<PhotoCardDetailsModuleInteractorOutput> output;

@end
