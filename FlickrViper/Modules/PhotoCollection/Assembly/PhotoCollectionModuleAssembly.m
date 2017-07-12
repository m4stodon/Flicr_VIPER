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

#import "FVApplicationAssembly.h"

// protocols
#import "PhotoCollectionModuleInput.h"
#import "PhotoCollectionModuleOutput.h"
#import "ModuleFactoryProtocol.h"


@interface PhotoCollectionModuleAssembly()

@end

@implementation PhotoCollectionModuleAssembly

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"PhotoCollectionModuleAssembly::Init");
    }
    return self;
}

- (id<PhotoCollectionModuleOutput>)assemblePhotoCollectionModuleWithModuleFactory: (id<ModuleFactoryProtocol>)factory {
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
- (PhotoCollectionModuleViewController*)viewWithStoryBoard {
    
    return [TyphoonDefinition withFactory: [self storyBoardWithName: @"Main"]
                                 selector: @selector(instantiateViewControllerWithIdentifier:)
                               parameters: ^(TyphoonMethod *factoryMethod) {
                                   
                                   // init view controller with identifier
                                   [factoryMethod injectParameterWith: @"PhotoCollectionModuleViewController"];
                               }
                            configuration: ^(TyphoonFactoryDefinition *definition) {
                                
                                // inject presenter as view output
                                [definition injectProperty: @selector(output)
                                                      with: [self presenter]];
                            }];
}

// UI FROM CODE
//- (PhotoCollectionModuleViewController*)view {
//
//    return [TyphoonDefinition withClass: [PhotoCollectionModuleViewController class]
//                          configuration: ^(TyphoonDefinition *definition) {
//
//                              // inject presenter as view output
//                              [definition injectProperty: @selector(output)
//                                                    with: [self presenter]];
//                          }];
//}

- (PhotoCollectionModuleInteractor*)interactor {
    
    return [TyphoonDefinition withClass: [PhotoCollectionModuleInteractor class]
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

- (PhotoCollectionModulePresenter*)presenter {
    
    return [TyphoonDefinition withClass: [PhotoCollectionModulePresenter class]
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

- (PhotoCollectionModuleRouter*)router {
    
    return [TyphoonDefinition withClass: [PhotoCollectionModuleRouter class]
                          configuration: ^(TyphoonDefinition *definition) {
                              
                              // inject view as router action handler
                              [definition injectProperty: @selector(transitionHandler)
                                                    with: [self viewWithStoryBoard]]; // UI WITH STORYBOARDS
                          }];
}

@end
