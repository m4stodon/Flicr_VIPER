//
//  TabBarRouterInput.h
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


@class PhotoCardEntity;


@protocol PhotoCollectionModuleRouterInput <NSObject>

- (void)showDetailsFor: (PhotoCardEntity*)photoCard;

@end
