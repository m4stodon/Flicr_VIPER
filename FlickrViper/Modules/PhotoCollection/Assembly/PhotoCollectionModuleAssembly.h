//
//  PhotoCollectionModuleAssembly.h
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


@import Foundation;
@import Typhoon;

@class PhotoCollectionModulePresenter;


@interface PhotoCollectionModuleAssembly: TyphoonAssembly
- (PhotoCollectionModulePresenter*)photoCollectionPresenter;
@end
