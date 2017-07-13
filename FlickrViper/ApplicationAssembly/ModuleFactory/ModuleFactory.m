//
//  ModuleFactory.m
//  FlickrViper
//
//  Created by Yermakov on 7/10/17.
//  Copyright © 2017 Yermakov. All rights reserved.
//


#import "ModuleFactory.h"
#import "TabBarModuleAssembly.h"


@implementation ModuleFactory


- (TabBarModuleAssembly*)tabBarModule {
    return [TyphoonDefinition withClass: [TabBarModuleAssembly class]
                          configuration: ^(TyphoonDefinition *definition) {
                          }];
}

- (AuthorizationModuleAssembly*)authorizationModule {
    return [TyphoonDefinition withClass: [AuthorizationModuleAssembly class]
                          configuration: ^(TyphoonDefinition *definition) {
                          }];
}

- (PhotoCollectionModuleAssembly*)photoCollectionModule {
    return [TyphoonDefinition withClass: [PhotoCollectionModuleAssembly class]
                          configuration: ^(TyphoonDefinition *definition) {
                          }];
}


@end
