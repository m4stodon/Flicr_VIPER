//
//  FVAssembly.h
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


@import Foundation;
@import Typhoon;
#import "PhotoCollectionModuleAssembly.h"
#import "PhotoCollectionModulePresenter.h"
#import "AuthorizationModuleAssembly.h"
#import "TabBarModuleAssembly.h"



@class FVAppDelegate;



/**
 Assembly for the FlickrViper Application
 */
@interface FVApplicationAssembly : TyphoonAssembly

/**
 Provide dependency injection on the app delegate
 Init and inject rootViewController
 */
- (FVAppDelegate *)appDelegate;




@end
