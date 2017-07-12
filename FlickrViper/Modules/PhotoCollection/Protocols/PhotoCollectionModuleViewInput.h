//
//  TabBarViewInput.h
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


@import Foundation;


@protocol TabEntity;


@protocol PhotoCollectionModuleViewInput <NSObject>

- (void)setupTabs: (NSArray<id<TabEntity>>*)tabs;

@end
