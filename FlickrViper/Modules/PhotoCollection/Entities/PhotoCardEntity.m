//
//  PhotoCardEntity.m
//  FlickrViper
//
//  Created by Yermakov on 7/14/17.
//  Copyright © 2017 Yermakov. All rights reserved.
//


#import "PhotoCardEntity.h"


@implementation PhotoCardEntity

- (instancetype)initWith: (UIImage*)image text: (NSString*)text descriptionText: (NSString*)description {
    self = [super init];
    if (self) {
        self.photo = image;
        self.label = text;
        self.descriptionText = description;
    }
    return self;
}

@end
