//
//  PhotoCardDetailsModuleAssembly.h
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


@import Foundation;
@import Typhoon;


@class PhotoCardDetailsModulePresenter;


@interface PhotoCardDetailsModuleAssembly : TyphoonAssembly

- (PhotoCardDetailsModulePresenter*)photoCardDetailsPresenter;

@end
