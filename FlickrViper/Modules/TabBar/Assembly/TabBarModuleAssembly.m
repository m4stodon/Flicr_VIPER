//
//  TabBarModuleAssembly.m
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


// components
#import "TabBarModuleAssembly.h"
#import "TabBarModuleViewController.h"
#import "TabBarModuleInteractor.h"
#import "TabBarModulePresenter.h"
#import "TabBarModuleRouter.h"

#import "FVApplicationAssembly.h"

// protocols
#import "TabBarModuleInput.h"
#import "TabBarModuleOutput.h"
#import "ModuleFactoryProtocol.h"


@interface TabBarModuleAssembly()

@end

@implementation TabBarModuleAssembly

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"TabBarModuleAssembly::Init");
    }
    return self;
}

- (id<TabBarModuleOutput>)assembleTabBarModuleWithModuleFactory: (id<ModuleFactoryProtocol>)factory {
    return [self presenter];
}

- (UIStoryboard *)storyBoardWithName: (NSString *)name {
    
    return [TyphoonDefinition withClass: [UIStoryboard class]
                          configuration: ^(TyphoonDefinition *definition) {
                              [definition useInitializer: @selector(storyboardWithName:bundle:)
                                              parameters: ^(TyphoonMethod *initializer) {
                                                  [initializer injectParameterWith: name];
                                                  [initializer injectParameterWith: NSBundle.mainBundle];
                                              }];
                          }];
}

// UI WITH STORYBOARDS
- (TabBarModuleViewController*)viewWithStoryBoard {
    
    return [TyphoonDefinition withFactory: [self storyBoardWithName: @"Main"]
                                 selector: @selector(instantiateViewControllerWithIdentifier:)
                               parameters: ^(TyphoonMethod *factoryMethod) {
                                   
                                   // init view controller with identifier
                                   [factoryMethod injectParameterWith: @"TabBarModuleViewController"];
                               }
                            configuration: ^(TyphoonFactoryDefinition *definition) {
                                
                                // inject presenter as view output
                                [definition injectProperty: @selector(output)
                                                      with: [self presenter]];
                            }];
}

// UI FROM CODE
//- (TabBarModuleViewController*)view {
//
//    return [TyphoonDefinition withClass: [TabBarModuleViewController class]
//                          configuration: ^(TyphoonDefinition *definition) {
//
//                              // inject presenter as view output
//                              [definition injectProperty: @selector(output)
//                                                    with: [self presenter]];
//                          }];
//}

- (TabBarModuleInteractor*)interactor {
    
    return [TyphoonDefinition withClass: [TabBarModuleInteractor class]
                          configuration: ^(TyphoonDefinition *definition) {
                              
                              // inject presenter as interactor output
                              [definition injectProperty: @selector(output)
                                                    with: [self presenter]];
                              
                              // inject <ModuleFactoryProtocol> compatible object
                              // to instantiate tabs modules
                              //if(self.moduleFactory) {
                              //    [definition injectProperty: @selector(moduleFactory)
                              //                          with: self.moduleFactory];
                              //}
                          }];
}

- (TabBarModulePresenter*)presenter {
    
    return [TyphoonDefinition withClass: [TabBarModulePresenter class]
                          configuration: ^(TyphoonDefinition *definition) {
                              
                              // inject view into presenter
                              // inject interactor into presenter
                              // inject router into presenter
                              [definition injectProperty: @selector(view)
                                                    with: [self viewWithStoryBoard]]; // UI WITH STORYBOARDS
                              [definition injectProperty: @selector(interactor)
                                                    with: [self interactor]];
                              [definition injectProperty: @selector(router)
                                                    with: [self router]];
                          }];
}

- (TabBarModuleRouter*)router {
    
    return [TyphoonDefinition withClass: [TabBarModuleRouter class]
                          configuration: ^(TyphoonDefinition *definition) {
                              
                              // inject view as router action handler
                              [definition injectProperty: @selector(transitionHandler)
                                                    with: [self viewWithStoryBoard]]; // UI WITH STORYBOARDS
                          }];
}

@end
