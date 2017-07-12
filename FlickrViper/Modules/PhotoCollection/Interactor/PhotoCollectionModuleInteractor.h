//
//  TabBarInteractor.h
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


@import Foundation;
@import UIKit;
#import "PhotoCollectionModuleInteractorInput.h"
#import "PhotoCollectionModuleInteractorOutput.h"
#import "ModuleFactoryProtocol.h"


@interface PhotoCollectionModuleInteractor : NSObject <PhotoCollectionModuleInteractorInput>

@property (weak, nonatomic)   id<ModuleFactoryProtocol>        moduleFactory;
@property (strong, nonatomic) id<PhotoCollectionModuleInteractorOutput> output;

@end
