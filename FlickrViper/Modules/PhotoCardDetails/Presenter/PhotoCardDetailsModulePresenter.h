//
//  TabBarPresenter.h
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


@import Foundation;
#import "PhotoCardDetailsModuleInput.h"
#import "PhotoCardDetailsModuleOutput.h"
#import "PhotoCardDetailsModuleViewInput.h"
#import "PhotoCardDetailsModuleViewOutput.h"
#import "PhotoCardDetailsModuleRouterInput.h"
#import "PhotoCardDetailsModuleInteractorInput.h"
#import "PhotoCardDetailsModuleInteractorOutput.h"



@interface PhotoCardDetailsModulePresenter: NSObject
<PhotoCardDetailsModuleInput, PhotoCardDetailsModuleInteractorOutput, PhotoCardDetailsModuleViewOutput>


@property (nonatomic, weak)   id<PhotoCardDetailsModuleViewInput>       view;
@property (nonatomic, strong) id<PhotoCardDetailsModuleInteractorInput> interactor;
@property (nonatomic, strong) id<PhotoCardDetailsModuleRouterInput>     router;
@property (nonatomic, strong) id<PhotoCardDetailsModuleOutput>          output;


@end
