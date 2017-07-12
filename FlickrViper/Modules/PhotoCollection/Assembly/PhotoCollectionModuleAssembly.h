//
//  PhotoCollectionModuleAssembly.h
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


@import Foundation;
@import Typhoon;

@protocol PhotoCollectionModuleInput;
@protocol PhotoCollectionModuleOutput;
@protocol ModuleFactoryProtocol;


@interface PhotoCollectionModuleAssembly : TyphoonAssembly


- (id<PhotoCollectionModuleOutput>)assemblePhotoCollectionModuleWithModuleFactory: (id<ModuleFactoryProtocol>)factory;

@end
