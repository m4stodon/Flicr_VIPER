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

#import "FVApplicationAssembly.h"

// protocols
#import "AuthorizationModuleInput.h"
#import "AuthorizationModuleOutput.h"
#import "ModuleFactoryProtocol.h"


@interface AuthorizationModuleAssembly()

@end


@implementation AuthorizationModuleAssembly

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"AuthorizationModuleAssembly::Init");
    }
    return self;
}

- (id<AuthorizationModuleOutput>)assembleAuthorizationModuleWithModuleFactory: (id<ModuleFactoryProtocol>)factory {    
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
- (AuthorizationModuleViewController*)viewWithStoryBoard {
    
    return [TyphoonDefinition withFactory: [self storyBoardWithName: @"Authorization"]
                                 selector: @selector(instantiateViewControllerWithIdentifier:)
                               parameters: ^(TyphoonMethod *factoryMethod) {
                                   
                                   // init view controller with identifier
                                   [factoryMethod injectParameterWith: @"AuthorizationModuleViewController"];
                               }
                            configuration: ^(TyphoonFactoryDefinition *definition) {
                                
                                // inject presenter as view output
                                [definition injectProperty: @selector(output)
                                                      with: [self presenter]];
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

- (AuthorizationModuleInteractor*)interactor {
    
    return [TyphoonDefinition withClass: [AuthorizationModuleInteractor class]
                          configuration: ^(TyphoonDefinition *definition) {
                              
                              // inject presenter as interactor output
                              [definition injectProperty: @selector(output)
                                                    with: [self presenter]];
                          }];
}

- (AuthorizationModulePresenter*)presenter {
    
    return [TyphoonDefinition withClass: [AuthorizationModulePresenter class]
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

- (AuthorizationModuleRouter*)router {
    
    return [TyphoonDefinition withClass: [AuthorizationModuleRouter class]
                          configuration: ^(TyphoonDefinition *definition) {
                              
                              // inject view as router action handler
                              [definition injectProperty: @selector(transitionHandler)
                                                    with: [self viewWithStoryBoard]]; // UI WITH STORYBOARDS                              
                          }];
}

@end
