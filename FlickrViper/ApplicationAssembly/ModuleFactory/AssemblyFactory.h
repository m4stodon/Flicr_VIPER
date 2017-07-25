//
//  AssemblyFactory.h
//  FlickrViper
//
//  Created by Ermac on 23.07.17.
//  Copyright © 2017 Yermakov. All rights reserved.
//


#import <Foundation/Foundation.h>


#import "TabBarModuleAssembly.h"
#import "AuthorizationModuleAssembly.h"
#import "PhotoCollectionModuleAssembly.h"
#import "ModuleFactoryProtocol.h"


@interface AssemblyFactory : TyphoonAssembly <ModuleFactoryProtocol>



@end
