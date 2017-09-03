//
//  TabBarViewController.m
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


#import "PhotoCardDetailsModuleViewController.h"
#import "PhotoCardDetailsModuleViewOutput.h"
#import "PhotoCardEntity.h"


@interface PhotoCardDetailsModuleViewController()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *frontPageImageView;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (strong, nonatomic) PhotoCardEntity* magazine;

@end


@implementation PhotoCardDetailsModuleViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.output viewSetupCallback];
}

- (void)viewWillAppear: (BOOL)animated {
    [super viewWillAppear: animated];
    [self.navigationController setNavigationBarHidden: NO animated: YES];
}

- (void)viewWillDisappear: (BOOL)animated {
    [super viewWillDisappear: animated];
    [self.navigationController setNavigationBarHidden: YES animated: YES];
}


#pragma mark - PhotoCardDetailsModuleViewInput


- (void)setupViewWith:(PhotoCardEntity *)entity {
    self.titleLabel.text          = entity.label;
    self.frontPageImageView.image = entity.photo;
    self.descriptionLabel.text    = entity.descriptionText;
}



@end
