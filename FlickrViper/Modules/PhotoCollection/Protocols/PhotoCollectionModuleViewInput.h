//
//  TabBarViewInput.h
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


@protocol TabEntity;
@class PhotoCardEntity;


@protocol PhotoCollectionModuleViewInput <NSObject>

- (void)show: (NSArray<PhotoCardEntity*>*)newPhotoCards;

@end
