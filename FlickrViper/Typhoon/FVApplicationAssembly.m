//
//  RIAssembly.m
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//

#import "FVApplicationAssembly.h"
#import "FVAppDelegate.h"
#import "FVStartupConfigurator.h"
#import "FVStartUpConfiguratorDelegate.h"


@implementation FVApplicationAssembly


- (id<FVStartUpConfiguratorDelegate>)startUpConfigurator {
    return [TyphoonDefinition withClass: [FVStartUpConfigurator class]];
}


- (FVAppDelegate *)appDelegate {
    return [TyphoonDefinition withClass: [FVAppDelegate class]
                          configuration: ^(TyphoonDefinition *definition) {
                              
                              [definition injectProperty: @selector(startUpConfigurator)
                                                    with: [self startUpConfigurator]];
                          }];
}


@end
