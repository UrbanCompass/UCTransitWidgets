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

    self.view.backgroundColor = [UIColor whiteColor];

    NSMutableArray *lines = [[NSMutableArray alloc] init];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemNYCSubway line:@"1"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemNYCSubway line:@"2"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemNYCSubway line:@"3"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemNYCSubway line:@"4"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemNYCSubway line:@"5"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemNYCSubway line:@"6"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemNYCSubway line:@"6X"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemNYCSubway line:@"7"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemNYCSubway line:@"7X"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemNYCSubway line:@"A"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemNYCSubway line:@"B"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemNYCSubway line:@"C"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemNYCSubway line:@"D"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemNYCSubway line:@"E"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemNYCSubway line:@"F"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemNYCSubway line:@"G"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemNYCSubway line:@"J"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemNYCSubway line:@"L"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemNYCSubway line:@"M"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemNYCSubway line:@"N"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemNYCSubway line:@"Q"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemNYCSubway line:@"R"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemNYCSubway line:@"S"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemNYCSubway line:@"T"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemNYCSubway line:@"Z"]];
    self.lines = lines;

    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(80.f, 80.f);
    flowLayout.minimumLineSpacing = 20.f;
    flowLayout.minimumInteritemSpacing = 10.f;

    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];

    [self.collectionView registerClass:[UCIconCell class] forCellWithReuseIdentifier:@"default"];

    self.automaticallyAdjustsScrollViewInsets = YES;

    CGFloat statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
    self.collectionView.frame = CGRectMake(0.f, statusBarHeight, self.view.bounds.size.width, self.view.bounds.size.height - statusBarHeight);
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
