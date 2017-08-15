//
//  PhotoCardDetailsModuleInput.h
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


@class PhotoCardEntity;


@protocol PhotoCardDetailsModuleInput <NSObject>

- (UIViewController*)photoCardDetailsModuleRootViewController;
- (void)setupModuleWith: (PhotoCardEntity*)photoCard;

@end
