//
//  PhotoCollectionModuleAssembly.m
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


// components
#import "PhotoCollectionModuleAssembly.h"
#import "PhotoCollectionModuleViewController.h"
#import "PhotoCollectionModuleInteractor.h"
#import "PhotoCollectionModulePresenter.h"
#import "PhotoCollectionModuleRouter.h"

// protocols
#import "PhotoCollectionModuleInput.h"
#import "PhotoCollectionModuleOutput.h"


@implementation PhotoCollectionModuleAssembly

- (UIStoryboard *)photoCollectionStoryBoardWithName: (NSString *)name {
    
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
- (PhotoCollectionModuleViewController*)photoCollectionViewWithStoryBoard {
    
    return [TyphoonDefinition withFactory: [self photoCollectionStoryBoardWithName: @"PhotoCollection"]
                                 selector: @selector(instantiateViewControllerWithIdentifier:)
                               parameters: ^(TyphoonMethod *factoryMethod) {
                                   
                                   // init view controller with identifier
                                   [factoryMethod injectParameterWith: @"PhotoCollectionModuleViewController"];
                               }
                            configuration: ^(TyphoonFactoryDefinition *definition) {
                                
                                definition.scope = TyphoonScopeSingleton;
                                
                                // inject presenter as view output
                                [definition injectProperty: @selector(output)
                                                      with: [self photoCollectionPresenter]];
                            }];
}

- (PhotoCollectionModuleInteractor*)photoCollectionInteractor {
    
    return [TyphoonDefinition withClass: [PhotoCollectionModuleInteractor class]
                          configuration: ^(TyphoonDefinition *definition) {
                              
                              // inject presenter as interactor output
                              [definition injectProperty: @selector(output)
                                                    with: [self photoCollectionPresenter]];
                          }];
}

- (PhotoCollectionModulePresenter*)photoCollectionPresenter {
    
    return [TyphoonDefinition withClass: [PhotoCollectionModulePresenter class]
                          configuration: ^(TyphoonDefinition *definition) {
                              
                              definition.scope = TyphoonScopeSingleton;
                              
                              // inject view into presenter
                              // inject interactor into presenter
                              // inject router into presenter
                              [definition injectProperty: @selector(view)
                                                    with: [self photoCollectionViewWithStoryBoard]];
                              [definition injectProperty: @selector(interactor)
                                                    with: [self photoCollectionInteractor]];
                              [definition injectProperty: @selector(router)
                                                    with: [self photoCollectionRouter]];
                          }];
}

- (PhotoCollectionModuleRouter*)photoCollectionRouter {
    
    return [TyphoonDefinition withClass: [PhotoCollectionModuleRouter class]
                          configuration: ^(TyphoonDefinition *definition) {
                              
                              // inject view as router action handler
                              [definition injectProperty: @selector(transitionHandler)
                                                    with: [self photoCollectionViewWithStoryBoard]];
                          }];
}

@end
