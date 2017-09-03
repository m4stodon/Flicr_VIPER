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


#pragma mark - Lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate   = self;
    PhotoCollectionFlowLayout* layout = [PhotoCollectionFlowLayout new];
    layout.estimatedItemSize = CGSizeMake(100, 100);
    self.collectionView.collectionViewLayout = layout;
    
    [self.output viewSetupCallback];
}


#pragma mark - PhotoCollectionModuleViewInput


- (void)show: (NSArray<PhotoCardEntity *> *)newPhotoCards {
    self.magazines = newPhotoCards;
    [self.collectionView reloadData];
}


#pragma mark - UICollectionViewDataSource


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView: (UICollectionView *)collectionView numberOfItemsInSection: (NSInteger)section {
    return self.magazines.count;
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
    [self.navigationController pushViewController: viewController animated: YES];
}



@end
