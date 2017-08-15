//
//  PhotoCollectionCell.h
//  FlickrViper
//
//  Created by Yermakov on 7/14/17.
//  Copyright © 2017 Yermakov. All rights reserved.
//


#import <UIKit/UIKit.h>

@class PhotoCardEntity;


@interface PhotoCollectionCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;

- (void)setupCellWith: (PhotoCardEntity*)photoCard basedOnWidth: (CGFloat)width;

@end
