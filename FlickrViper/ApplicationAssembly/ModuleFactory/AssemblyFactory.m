//
//  AssemblyFactory.m
//  FlickrViper
//
//  Created by Ermac on 23.07.17.
//  Copyright © 2017 Yermakov. All rights reserved.
//


#import "AssemblyFactory.h"
#import "TabBarModuleAssembly.h"


@implementation AssemblyFactory


//- (instancetype)init {
//    self = [super init];
//    if (self) {
//        NSLog(@"  ---  AssemblyFactory instantiated  ---  ");
//    }
//    return self;
//}


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
