//
//  TabBarInteractor.m
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


#import "PhotoCardDetailsModuleInteractor.h"
#import "TabEntity.h"
#import "FlickrViperTransitionHandlerProtocol.h"


@interface PhotoCardDetailsModuleInteractor()
@property (strong, nonatomic) PhotoCardEntity* entity;
@end

@implementation PhotoCardDetailsModuleInteractor


#pragma mark - PhotoCardDetailsModuleInteractorInput


- (void)setPhotoCardEntity: (PhotoCardEntity *)entity {
    self.entity = entity;
}


#pragma mark - PhotoCardDetailsModuleInteractorOutput


- (PhotoCardEntity *)getPhotoCardEntity {
    return self.entity;
}

@end
