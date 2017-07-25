//
//  SettingsModuleAssembly.m
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


// components
#import "SettingsModuleAssembly.h"
#import "SettingsModuleViewController.h"
#import "SettingsModuleInteractor.h"
#import "SettingsModulePresenter.h"
#import "SettingsModuleRouter.h"
#import "ModuleFactory.h"

// protocols
#import "SettingsModuleInput.h"
#import "SettingsModuleOutput.h"
#import "ModuleFactoryProtocol.h"


@implementation SettingsModuleAssembly


//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
//        NSLog(@"SettingsModuleAssembly::Init");
//    }
//    return self;
//}


- (UIStoryboard *)settingsStoryBoardWithName: (NSString *)name {
    
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
- (SettingsModuleViewController*)settingsViewWithStoryBoard {
    
    return [TyphoonDefinition withFactory: [self settingsStoryBoardWithName: @"Settings"]
                                 selector: @selector(instantiateViewControllerWithIdentifier:)
                               parameters: ^(TyphoonMethod *factoryMethod) {
                                   
                                   // init view controller with identifier
                                   [factoryMethod injectParameterWith: @"SettingsModuleViewController"];
                               }
                            configuration: ^(TyphoonFactoryDefinition *definition) {
                                
                                definition.scope = TyphoonScopeSingleton;
                                
                                // inject presenter as view output
                                [definition injectProperty: @selector(output)
                                                      with: [self settingsPresenter]];
                            }];
}

// UI FROM CODE
//- (SettingsModuleViewController*)view {
//
//    return [TyphoonDefinition withClass: [SettingsModuleViewController class]
//                          configuration: ^(TyphoonDefinition *definition) {
//
//                              // inject presenter as view output
//                              [definition injectProperty: @selector(output)
//                                                    with: [self presenter]];
//                          }];
//}

- (SettingsModuleInteractor*)settingsInteractor {
    
    return [TyphoonDefinition withClass: [SettingsModuleInteractor class]
                          configuration: ^(TyphoonDefinition *definition) {
                              
                              // inject presenter as interactor output
                              [definition injectProperty: @selector(output)
                                                    with: [self settingsPresenter]];
                              
                              // inject <ModuleFactoryProtocol> compatible object
                              // to instantiate tabs modules
                              //if(self.moduleFactory) {
                              //    [definition injectProperty: @selector(moduleFactory)
                              //                          with: self.moduleFactory];
                              //}
                          }];
}

- (SettingsModulePresenter*)settingsPresenter {
    
    return [TyphoonDefinition withClass: [SettingsModulePresenter class]
                          configuration: ^(TyphoonDefinition *definition) {
                              
                              definition.scope = TyphoonScopeSingleton;
                              
                              // inject view into presenter
                              // inject interactor into presenter
                              // inject router into presenter
                              [definition injectProperty: @selector(view)
                                                    with: [self settingsViewWithStoryBoard]]; // UI WITH STORYBOARDS
                              [definition injectProperty: @selector(interactor)
                                                    with: [self settingsInteractor]];
                              [definition injectProperty: @selector(router)
                                                    with: [self settingsRouter]];
                          }];
}

- (SettingsModuleRouter*)settingsRouter {
    
    return [TyphoonDefinition withClass: [SettingsModuleRouter class]
                          configuration: ^(TyphoonDefinition *definition) {
                              
                              // inject view as router action handler
                              [definition injectProperty: @selector(transitionHandler)
                                                    with: [self settingsViewWithStoryBoard]]; // UI WITH STORYBOARDS
                              
                              // inject module factory
//                              [definition injectProperty: @selector(moduleFactory)
//                                                    with: [self moduleFactoryAssembly]];
                          }];
}

//- (ModuleFactory*)moduleFactoryAssembly {
//    // Assemble unified Module Factory
//    // We can create and use defined Module Factories for each module to restrict access to other modules from this
//    return [TyphoonDefinition withClass: [ModuleFactory class]
//                          configuration: ^(TyphoonDefinition *definition) {
//                              definition.scope = TyphoonScopeSingleton;
//                          }];
//}

@end
