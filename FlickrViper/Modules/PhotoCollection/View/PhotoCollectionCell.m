//
//  PhotoCollectionCell.m
//  FlickrViper
//
//  Created by Yermakov on 7/14/17.
//  Copyright © 2017 Yermakov. All rights reserved.
//


#import "PhotoCollectionCell.h"
#import "PhotoCardEntity.h"


@interface PhotoCollectionCell()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cellWidthConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cellImageHeightConstraint;

@end


@implementation PhotoCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setupCellWith: (PhotoCardEntity*)photoCard basedOnWidth: (CGFloat)width {
    self.imageView.image = photoCard.photo;
    self.textLabel.text  = photoCard.label;
    self.cellWidthConstraint.constant = width;
    self.cellImageHeightConstraint.constant = photoCard.photo.size.height * width / photoCard.photo.size.width;
    [self setNeedsLayout];
}

@end
