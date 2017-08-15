//
//  TabBarViewController.m
//  FlickrViper
//
//  Created by Yermakov on 15/05/2017.
//  Copyright © 2017 Yermakov. All rights reserved.
//


#import "PhotoCollectionModuleViewController.h"
#import "PhotoCollectionModuleViewOutput.h"
#import "PhotoCardEntity.h"
#import "PhotoCollectionCell.h"
#import "PhotoCollectionFlowLayout.h"


@interface PhotoCollectionModuleViewController() <UICollectionViewDataSource, UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSArray<PhotoCardEntity*>* magazines;

@end


@implementation PhotoCollectionModuleViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    self.collectionView.dataSource = self;
    self.collectionView.delegate   = self;
    PhotoCollectionFlowLayout* layout = [PhotoCollectionFlowLayout new];
    layout.estimatedItemSize = CGSizeMake(100, 100);
    self.collectionView.collectionViewLayout = layout;
}

- (void)initData {
    self.magazines = [NSArray arrayWithObjects:
                      [[PhotoCardEntity alloc] initWith: [UIImage imageNamed: @"Fallout4_AwesomeTales1"] text: @"Issue #1" descriptionText: @""],
                      [[PhotoCardEntity alloc] initWith: [UIImage imageNamed: @"Fallout4_AwesomeTales2"] text: @"Issue #2" descriptionText: @""],
                      [[PhotoCardEntity alloc] initWith: [UIImage imageNamed: @"Fallout4_AwesomeTales3"] text: @"Issue #3" descriptionText: @""],
                      [[PhotoCardEntity alloc] initWith: [UIImage imageNamed: @"Fallout4_AwesomeTales4"] text: @"Issue #4" descriptionText: @""],
                      [[PhotoCardEntity alloc] initWith: [UIImage imageNamed: @"Fallout4_AwesomeTales6"] text: @"Issue #6" descriptionText: @""],
                      [[PhotoCardEntity alloc] initWith: [UIImage imageNamed: @"Fallout4_AwesomeTales8"] text: @"Issue #8" descriptionText: @""],
                      [[PhotoCardEntity alloc] initWith: [UIImage imageNamed: @"Fallout4_AwesomeTales9"] text: @"Issue #9" descriptionText: @""],
                      [[PhotoCardEntity alloc] initWith: [UIImage imageNamed: @"Fallout4_AwesomeTales10"] text: @"Issue #10" descriptionText: @""],
                      [[PhotoCardEntity alloc] initWith: [UIImage imageNamed: @"Fallout4_AwesomeTales12"] text: @"Issue #12" descriptionText: @""],
                      [[PhotoCardEntity alloc] initWith: [UIImage imageNamed: @"Fallout4_AwesomeTales13"] text: @"Issue #13" descriptionText: @""],
                      [[PhotoCardEntity alloc] initWith: [UIImage imageNamed: @"Fallout4_AwesomeTales41"] text: @"Issue #41" descriptionText: @""],
                      [[PhotoCardEntity alloc] initWith: [UIImage imageNamed: @"Fallout4_AwesomeTales43"] text: @"Issue #43" descriptionText: @""],
                      [[PhotoCardEntity alloc] initWith: [UIImage imageNamed: @"Fallout4_AwesomeTales121"] text: @"Issue #121" descriptionText: @""],
                      nil];
}


#pragma mark - UICollectionViewDataSource


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView: (UICollectionView *)collectionView numberOfItemsInSection: (NSInteger)section {
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    PhotoCollectionCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier: @"PhotoCollectionCell" forIndexPath: indexPath];
    
    [cell setupCellWith: self.magazines[indexPath.row] basedOnWidth: collectionView.frame.size.width / 2 - 5];
    
    return cell;
}


#pragma mark - UICollectionViewDelegate


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self.output didSelectItem: self.magazines[indexPath.row]];
}


#pragma mark - FlickrViperTransitionHandlerProtocol


- (void)pushVC:(UIViewController *)viewController {
    [self presentViewController: viewController animated: YES completion: nil];
}



@end
