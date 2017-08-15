//
//  AssemblyFactory.m
//  FlickrViper
//
//  Created by Ermac on 23.07.17.
//  Copyright © 2017 Yermakov. All rights reserved.
//


#import "AssemblyFactory.h"

#import "TabBarModuleAssembly.h"
#import "AuthorizationModuleAssembly.h"
#import "PhotoCollectionModuleAssembly.h"
#import "SettingsModuleAssembly.h"
#import "PhotoCardDetailsModuleAssembly.h"


@implementation AssemblyFactory


//- (instancetype)init {
//    self = [super init];
//    if (self) {
//        NSLog(@"  ---  AssemblyFactory instantiated  ---  ");
//    }
//    return self;
//}


- (TabBarModuleAssembly*)tabBarModule {
    return [TyphoonDefinition withClass: [TabBarModuleAssembly class]];
}

- (AuthorizationModuleAssembly*)authorizationModule {
    return [TyphoonDefinition withClass: [AuthorizationModuleAssembly class]];
}

- (PhotoCollectionModuleAssembly*)photoCollectionModule {
    return [TyphoonDefinition withClass: [PhotoCollectionModuleAssembly class]];
}

- (PhotoCardDetailsModuleAssembly*)photoCardDetailsModule {
    return [TyphoonDefinition withClass: [PhotoCardDetailsModuleAssembly class]];
}

- (SettingsModuleAssembly*)settingsModule {
    return [TyphoonDefinition withClass: [SettingsModuleAssembly class]];
}

@end
