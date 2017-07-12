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


#import "ModuleFactory.h"
#import "ModuleFactoryProtocol.h"


@class FVAppDelegate;
@class TabBarModuleAssembly;


/**
 Assembly for the FlickrViper Application
 */
@interface FVApplicationAssembly : TyphoonAssembly

/**
 Bootstrapping (init application assemblies)
 */


/**
 Provide dependency injection on the app delegate
 Init and inject rootViewController
 */
- (FVAppDelegate *)appDelegate;




@end
