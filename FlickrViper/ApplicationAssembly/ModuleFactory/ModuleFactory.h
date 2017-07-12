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


@interface ModuleFactory : TyphoonAssembly


//@property(nonatomic, strong, readonly) TabBarModuleAssembly *tabBarModule;

- (TabBarModuleAssembly*)tabBarModule;
- (AuthorizationModuleAssembly*)authorizationModule;
- (PhotoCollectionModuleAssembly*)photoCollectionModule;

@end
