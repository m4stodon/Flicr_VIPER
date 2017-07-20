//
//  ModuleFactory.h
//  FlickrViper
//
//  Created by Yermakov on 7/10/17.
//  Copyright © 2017 Yermakov. All rights reserved.
//


#import <Foundation/Foundation.h>


#import "TabBarModuleAssembly.h"
#import "AuthorizationModuleAssembly.h"
#import "PhotoCollectionModuleAssembly.h"
#import "ModuleFactoryProtocol.h"


@interface ModuleFactory : TyphoonAssembly <ModuleFactoryProtocol>
    

    
@end
