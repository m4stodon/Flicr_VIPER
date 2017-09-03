//
//  TabEntity.h
//  FlickrViper
//
//  Created by Yermakov on 16/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


@import Foundation;
@import UIKit;


@interface TabEntity : NSObject
@property NSString   *title;
@property UIImage    *image;
@property NSUInteger tabIndex;
@property NSString   *badge;
@property UIViewController* viewController;
@end
