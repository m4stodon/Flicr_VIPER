//
//  AuthorizationModuleAssembly.m
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


// components
#import "AuthorizationModuleAssembly.h"
#import "AuthorizationModuleViewController.h"
#import "AuthorizationModuleInteractor.h"
#import "AuthorizationModulePresenter.h"
#import "AuthorizationModuleRouter.h"
#import "ModuleFactory.h"

// protocols
#import "AuthorizationModuleInput.h"
#import "AuthorizationModuleOutput.h"
#import "ModuleFactoryProtocol.h"


@implementation AuthorizationModuleAssembly


//- (instancetype)init {
//    self = [super init];
//    if (self) {
//        NSLog(@"  ---  AuthorizationModuleAssembly instantiated  ---  ");
//    }
//    return self;
//}


- (UIStoryboard *)authStoryBoardWithName: (NSString *)name {
    
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
- (AuthorizationModuleViewController*)authViewWithStoryBoard {
    
    return [TyphoonDefinition withFactory: [self authStoryBoardWithName: @"Authorization"]
                                 selector: @selector(instantiateViewControllerWithIdentifier:)
                               parameters: ^(TyphoonMethod *factoryMethod) {
                                   
                                   // init view controller with identifier
                                   [factoryMethod injectParameterWith: @"AuthorizationModuleViewController"];
                               }
                            configuration: ^(TyphoonFactoryDefinition *definition) {
                                
                                // THIS IS MUST HAVE SETTING - WHICH RESTRICTS REPEATEDLY INSTANTIATING OF VIEW CONTROLLERS
                                definition.scope = TyphoonScopeSingleton;
                                
                                // inject presenter as view output
                                [definition injectProperty: @selector(output)
                                                      with: [self authPresenter]];
                            }];
}

// UI FROM CODE
//- (AuthorizationModuleViewController*)view {
//
//    return [TyphoonDefinition withClass: [AuthorizationModuleViewController class]
//                          configuration: ^(TyphoonDefinition *definition) {
//
//                              // inject presenter as view output
//                              [definition injectProperty: @selector(output)
//                                                    with: [self presenter]];
//                          }];
//}

- (AuthorizationModuleInteractor*)authInteractor {
    
    return [TyphoonDefinition withClass: [AuthorizationModuleInteractor class]
                          configuration: ^(TyphoonDefinition *definition) {
                              
                              // inject presenter as interactor output
                              [definition injectProperty: @selector(output)
                                                    with: [self authPresenter]];
                          }];
}

- (AuthorizationModulePresenter*)authPresenter {
    
    return [TyphoonDefinition withClass: [AuthorizationModulePresenter class]
                          configuration: ^(TyphoonDefinition *definition) {
                              
                              definition.scope = TyphoonScopeSingleton;
                              
                              // inject view into presenter
                              // inject interactor into presenter
                              // inject router into presenter
                              [definition injectProperty: @selector(view)
                                                    with: [self authViewWithStoryBoard]]; // UI WITH STORYBOARDS
                              [definition injectProperty: @selector(interactor)
                                                    with: [self authInteractor]];
                              [definition injectProperty: @selector(router)
                                                    with: [self authRouter]];
                          }];
}

- (AuthorizationModuleRouter*)authRouter {
    
    return [TyphoonDefinition withClass: [AuthorizationModuleRouter class]
                          configuration: ^(TyphoonDefinition *definition) {
                              
                              // inject view as router action handler
                              [definition injectProperty: @selector(transitionHandler)
                                                    with: [self authViewWithStoryBoard]]; // UI WITH STORYBOARDS
                              
                              // inject module factory
                               [definition injectProperty: @selector(moduleFactory)
                                                     with: [self moduleFactoryAssembly]];
                          }];
}

- (ModuleFactory*)moduleFactoryAssembly {
    // Assemble unified Module Factory
    // We can create and use defined Module Factories for each module to restrict access to other modules from this
    return [TyphoonDefinition withClass: [ModuleFactory class]
                          configuration: ^(TyphoonDefinition *definition) {
                              definition.scope = TyphoonScopeSingleton;
                          }];
}

@end
