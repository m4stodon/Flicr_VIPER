//
//  PhotoCardEntity.h
//  FlickrViper
//
//  Created by Yermakov on 7/14/17.
//  Copyright © 2017 Yermakov. All rights reserved.
//


@import Foundation;
@import UIKit;


@interface PhotoCardEntity : NSObject
@property (strong, nonatomic) UIImage* photo;
@property (strong, nonatomic) NSString* label;
@property (strong, nonatomic) NSString* descriptionText;
//
- (instancetype)initWith: (UIImage*)image text: (NSString*)text descriptionText: (NSString*)description;
@end
