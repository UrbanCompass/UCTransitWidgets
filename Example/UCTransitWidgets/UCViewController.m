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

    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroRail line:@"RD"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroRail line:@"BL"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroRail line:@"OR"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroRail line:@"YL"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroRail line:@"GR"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroRail line:@"SV"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroRail line:@"PU"]];

    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"10A"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"10B"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"10E"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"10R"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"10S"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"11Y"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"13Y"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"15K"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"15L"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"15M"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"16A"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"16B"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"16D"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"16E"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"16G"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"16H"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"16J"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"16K"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"16L"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"16P"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"16X"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"16Y"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"17A"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"17B"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"17F"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"17G"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"17H"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"17K"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"17L"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"17M"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"18E"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"18F"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"18G"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"18H"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"18J"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"18P"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"18R"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"18S"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"1A"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"1B"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"1C"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"1E"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"1Z"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"21A"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"21D"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"22A"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"22B"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"23A"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"23B"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"23T"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"25A"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"25B"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"25C"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"25D"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"25E"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"26A"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"28A"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"28F"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"28G"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"28X"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"29C"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"29E"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"29G"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"29H"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"29K"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"29N"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"29X"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"2A"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"2B"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"2T"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"30N"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"30S"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"31"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"32"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"33"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"34"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"36"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"37"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"38B"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"39"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"3A"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"3T"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"3Y"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"42"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"43"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"4A"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"4B"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"52"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"53"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"54"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"5A"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"60"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"62"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"63"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"64"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"70"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"74"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"79"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"7A"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"7B"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"7C"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"7F"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"7H"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"7M"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"7P"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"7W"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"7X"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"7Y"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"80"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"81"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"82"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"83"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"86"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"87"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"89"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"89M"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"8S"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"8W"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"8Z"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"90"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"92"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"93"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"94"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"96"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"97"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"9A"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"A11"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"A12"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"A2"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"A31"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"A32"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"A33"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"A4"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"A42"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"A46"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"A48"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"A6"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"A7"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"A8"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"A9"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"B2"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"B21"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"B22"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"B24"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"B25"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"B27"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"B29"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"B30"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"B31"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"B51"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"B8"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"B9"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"C11"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"C12"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"C13"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"C14"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"C2"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"C21"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"C22"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"C26"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"C27"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"C28"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"C29"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"C4"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"C40"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"C8"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"D1"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"D12"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"D13"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"D14"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"D2"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"D3"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"D31"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"D32"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"D33"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"D34"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"D4"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"D5"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"D51"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"D6"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"D8"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"E2"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"E3"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"E32"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"E4"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"E6"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"F1"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"F12"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"F13"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"F14"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"F2"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"F4"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"F6"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"F8"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"G12"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"G13"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"G14"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"G16"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"G2"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"G8"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"H1"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"H11"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"H12"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"H13"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"H2"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"H3"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"H4"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"H6"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"H8"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"H9"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"J1"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"J11"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"J12"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"J13"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"J2"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"J3"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"J4"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"J5"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"J7"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"J9"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"K11"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"K12"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"K13"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"K2"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"K6"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"K9"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"L1"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"L2"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"L8"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"M31"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"M4"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"M6"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"MWY"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"N2"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"N3"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"N4"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"N6"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"NH1"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"NH3"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"P12"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"P17"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"P18"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"P19"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"P6"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"Q1"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"Q2"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"Q4"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"Q5"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"Q6"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"R1"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"R11"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"R12"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"R2"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"R3"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"R4"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"REX"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"S1"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"S2"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"S35"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"S4"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"S41"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"S80"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"S9"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"S91"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"T14"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"T18"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"T2"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"U2"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"U4"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"U5"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"U6"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"U8"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"V12"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"V14"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"V15"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"V5"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"V7"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"V8"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"V9"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"W1"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"W13"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"W14"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"W15"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"W19"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"W2"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"W3"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"W4"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"W45"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"W47"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"W5"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"W6"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"W8"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"W9"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"X1"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"X2"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"X3"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"X8"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"X9"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"Y2"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"Y7"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"Y8"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"Z11"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"Z13"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"Z2"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"Z29"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"Z6"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"Z8"]];
    [lines addObject:[[UCTransitLine alloc] initWithSystem:UCTransitSystemDCMetroBus line:@"Z9"]];
    self.lines = lines;

    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(100.f, 100.f);
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
