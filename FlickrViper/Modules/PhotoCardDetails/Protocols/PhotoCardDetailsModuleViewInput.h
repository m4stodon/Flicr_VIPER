//
//  TabBarViewInput.h
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


@import Foundation;
@class PhotoCardEntity;


@protocol PhotoCardDetailsModuleViewInput <NSObject>

- (void)setupViewWith: (PhotoCardEntity*)entity;

@end
