//
//  TabBarInteractor.h
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


@import Foundation;
@import UIKit;
#import "TabBarInteractorInput.h"
#import "TabBarInteractorOutput.h"


@protocol TabEntity <NSObject>

@required
@property NSString   *title;
@property UIImage    *image;
@property NSUInteger tabIndex;

@optional
@property NSString   *badge;

@end



@interface TabBarInteractor : NSObject <TabBarInteractorInput>

@property (strong, nonatomic) id<TabBarInteractorOutput> output;

@end
