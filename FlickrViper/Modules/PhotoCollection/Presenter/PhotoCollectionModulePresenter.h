//
//  TabBarPresenter.h
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


@import Foundation;
#import "PhotoCollectionModuleInput.h"
#import "PhotoCollectionModuleOutput.h"
#import "PhotoCollectionModuleViewInput.h"
#import "PhotoCollectionModuleViewOutput.h"
#import "PhotoCollectionModuleRouterInput.h"
#import "PhotoCollectionModuleInteractorInput.h"
#import "PhotoCollectionModuleInteractorOutput.h"



@interface PhotoCollectionModulePresenter: NSObject
<PhotoCollectionModuleInput, PhotoCollectionModuleInteractorOutput, PhotoCollectionModuleViewOutput>
@property (nonatomic, weak)   id<PhotoCollectionModuleViewInput>       view;
@property (nonatomic, strong) id<PhotoCollectionModuleInteractorInput> interactor;
@property (nonatomic, strong) id<PhotoCollectionModuleRouterInput>     router;
@property (nonatomic, strong) id<PhotoCollectionModuleOutput>          output;
@end
