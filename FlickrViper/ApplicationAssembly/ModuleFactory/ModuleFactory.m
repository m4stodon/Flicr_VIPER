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


- (instancetype)init {
    self = [super init];
    if (self) {
        NSLog(@"  ---  ModuleFactory instantiated  ---  ");
    }
    return self;
}


- (TabBarModuleAssembly*)tabBarModule {
    
    return [TyphoonDefinition withClass: [TabBarModuleAssembly class]
                          configuration: ^(TyphoonDefinition *definition) {
                          }];
}

- (AuthorizationModuleAssembly*)authorizationModule {
    
    return [TyphoonDefinition withClass: [AuthorizationModuleAssembly class]
                          configuration: ^(TyphoonDefinition *definition) {
                              [definition injectProperty: @selector(moduleFactory)
                                                    with: self];
                          }];
}

- (PhotoCollectionModuleAssembly*)photoCollectionModule {
    
    return [TyphoonDefinition withClass: [PhotoCollectionModuleAssembly class]
                          configuration: ^(TyphoonDefinition *definition) {
                          }];
}

@end
