//
//  PhotoCardDetailsModuleAssembly.m
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


// components
#import "PhotoCardDetailsModuleAssembly.h"
#import "PhotoCardDetailsModuleViewController.h"
#import "PhotoCardDetailsModuleInteractor.h"
#import "PhotoCardDetailsModulePresenter.h"
#import "PhotoCardDetailsModuleRouter.h"
#import "ModuleFactory.h"

// protocols
#import "PhotoCardDetailsModuleInput.h"
#import "PhotoCardDetailsModuleOutput.h"
#import "ModuleFactoryProtocol.h"


@implementation PhotoCardDetailsModuleAssembly


//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
//        NSLog(@"PhotoCardDetailsModuleAssembly::Init");
//    }
//    return self;
//}


- (UIStoryboard *)PhotoCardDetailsStoryBoardWithName: (NSString *)name {
    
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
- (PhotoCardDetailsModuleViewController*)PhotoCardDetailsViewWithStoryBoard {
    
    return [TyphoonDefinition withFactory: [self PhotoCardDetailsStoryBoardWithName: @"PhotoCardDetails"]
                                 selector: @selector(instantiateViewControllerWithIdentifier:)
                               parameters: ^(TyphoonMethod *factoryMethod) {
                                   
                                   // init view controller with identifier
                                   [factoryMethod injectParameterWith: @"PhotoCardDetailsModuleViewController"];
                               }
                            configuration: ^(TyphoonFactoryDefinition *definition) {
                                
                                definition.scope = TyphoonScopeSingleton;
                                
                                // inject presenter as view output
                                [definition injectProperty: @selector(output)
                                                      with: [self photoCardDetailsPresenter]];
                            }];
}

// UI FROM CODE
//- (PhotoCardDetailsModuleViewController*)view {
//
//    return [TyphoonDefinition withClass: [PhotoCardDetailsModuleViewController class]
//                          configuration: ^(TyphoonDefinition *definition) {
//
//                              // inject presenter as view output
//                              [definition injectProperty: @selector(output)
//                                                    with: [self presenter]];
//                          }];
//}

- (PhotoCardDetailsModuleInteractor*)PhotoCardDetailsInteractor {
    
    return [TyphoonDefinition withClass: [PhotoCardDetailsModuleInteractor class]
                          configuration: ^(TyphoonDefinition *definition) {
                              
                              // inject presenter as interactor output
                              [definition injectProperty: @selector(output)
                                                    with: [self photoCardDetailsPresenter]];
                              
                              // inject <ModuleFactoryProtocol> compatible object
                              // to instantiate tabs modules
                              //if(self.moduleFactory) {
                              //    [definition injectProperty: @selector(moduleFactory)
                              //                          with: self.moduleFactory];
                              //}
                          }];
}

- (PhotoCardDetailsModulePresenter*)photoCardDetailsPresenter {
    
    return [TyphoonDefinition withClass: [PhotoCardDetailsModulePresenter class]
                          configuration: ^(TyphoonDefinition *definition) {
                              
                              definition.scope = TyphoonScopeSingleton;
                              
                              // inject view into presenter
                              // inject interactor into presenter
                              // inject router into presenter
                              [definition injectProperty: @selector(view)
                                                    with: [self PhotoCardDetailsViewWithStoryBoard]]; // UI WITH STORYBOARDS
                              [definition injectProperty: @selector(interactor)
                                                    with: [self PhotoCardDetailsInteractor]];
                              [definition injectProperty: @selector(router)
                                                    with: [self PhotoCardDetailsRouter]];
                          }];
}

- (PhotoCardDetailsModuleRouter*)PhotoCardDetailsRouter {
    
    return [TyphoonDefinition withClass: [PhotoCardDetailsModuleRouter class]
                          configuration: ^(TyphoonDefinition *definition) {
                              
                              // inject view as router action handler
                              [definition injectProperty: @selector(transitionHandler)
                                                    with: [self PhotoCardDetailsViewWithStoryBoard]]; // UI WITH STORYBOARDS
                              
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
