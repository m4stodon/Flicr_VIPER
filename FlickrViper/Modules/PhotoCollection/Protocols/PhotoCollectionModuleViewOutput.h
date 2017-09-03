//
//  TabBarViewOutput.h
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


@class PhotoCardEntity;


@protocol PhotoCollectionModuleViewOutput <NSObject>

- (void)viewSetupCallback;
- (void)didSelectItem: (PhotoCardEntity*)item;

@end
