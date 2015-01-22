//
//  UCViewController.m
//  UCTransitWidgets
//
//  Created by Jerry Wong on 01/22/2015.
//  Copyright (c) 2014 Jerry Wong. All rights reserved.
//

#import "UCViewController.h"

#import "UCTransitWidgets.h"

@interface UCIconCell : UICollectionViewCell
@property (nonatomic, copy) UCTransitLine *line;
@property (nonatomic) UCTransitIconView *iconView;
@end

@implementation UCIconCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.iconView = [[UCTransitIconView alloc] initWithFrame:self.bounds];
        self.iconView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        [self.contentView addSubview:self.iconView];
    }
    return self;
}

- (void)setLine:(UCTransitLine *)line {
    self.iconView.line = line;
}

@end

@interface UCViewController () <UICollectionViewDataSource>
@property (nonatomic) UICollectionView *collectionView;
@property (nonatomic) NSArray *lines;
@end

@implementation UCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSMutableArray *lines = [[NSMutableArray alloc] init];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemNYCSubway line:@"6"]];
    self.lines = lines;

    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(70.f, 70.f);
    flowLayout.minimumLineSpacing = 10.f;
    flowLayout.minimumInteritemSpacing = 10.f;

    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    self.collectionView.dataSource = self;
    [self.view addSubview:self.collectionView];

    [self.collectionView registerClass:[UCIconCell class] forCellWithReuseIdentifier:@"default"];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.lines count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UCIconCell *cell = (UCIconCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"default" forIndexPath:indexPath];
    cell.line = self.lines[indexPath.item];
    return cell;
}

@end
