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

// protocols
#import "TabBarModuleInput.h"
#import "TabBarModuleOutput.h"
#import "ModuleFactoryProtocol.h"


@implementation TabBarModuleAssembly

- (UIStoryboard *)tabBarStoryBoardWithName: (NSString *)name {
    
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
- (TabBarModuleViewController*)tabBarViewWithStoryBoard {
    
    return [TyphoonDefinition withFactory: [self tabBarStoryBoardWithName: @"Main"]
                                 selector: @selector(instantiateViewControllerWithIdentifier:)
                               parameters: ^(TyphoonMethod *factoryMethod) {
                                   
                                   // init view controller with identifier
                                   [factoryMethod injectParameterWith: @"TabBarModuleViewController"];
                               }
                            configuration: ^(TyphoonFactoryDefinition *definition) {
                                
                                // THIS IS MUST HAVE SETTING - WHICH RESTRICTS REPEATEDLY INSTANTIATING OF VIEW CONTROLLERS
                                definition.scope = TyphoonScopeSingleton;
                                
                                // inject presenter as view output
                                [definition injectProperty: @selector(output)
                                                      with: [self tabBarPresenter]];
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

- (TabBarModuleInteractor*)tabBarInteractor {
    
    return [TyphoonDefinition withClass: [TabBarModuleInteractor class]
                          configuration: ^(TyphoonDefinition *definition) {
                              
                              // inject presenter as interactor output
                              [definition injectProperty: @selector(output)
                                                    with: [self tabBarPresenter]];
                          }];
}

- (TabBarModulePresenter*)tabBarPresenter {
    
    return [TyphoonDefinition withClass: [TabBarModulePresenter class]
                          configuration: ^(TyphoonDefinition *definition) {
                              
                              definition.scope = TyphoonScopeSingleton;
                              
                              // inject view into presenter
                              // inject interactor into presenter
                              // inject router into presenter
                              [definition injectProperty: @selector(view)
                                                    with: [self tabBarViewWithStoryBoard]];
                              [definition injectProperty: @selector(interactor)
                                                    with: [self tabBarInteractor]];
                              [definition injectProperty: @selector(router)
                                                    with: [self tabBarRouter]];
                          }];
}

- (TabBarModuleRouter*)tabBarRouter {
    
    return [TyphoonDefinition withClass: [TabBarModuleRouter class]
                          configuration: ^(TyphoonDefinition *definition) {
                              
                              // inject view as router action handler
                              [definition injectProperty: @selector(transitionHandler)
                                                    with: [self tabBarViewWithStoryBoard]];
                          }];
}

@end
