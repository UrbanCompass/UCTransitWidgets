//
//  ViewController.m
//  UCTransitWidgets
//
//  Created by James Paolantonio on 10/15/15.
//  Copyright © 2015 Compass. All rights reserved.
//

#import "ViewController.h"

#import "UCTransitWidgets.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UCTransitSystem system = UCTransitSystemNYCSubway;
    UCTransitLine *line = [[UCTransitLine alloc] initWithSystem:system line:@"D"];
    UCTransitIconView *iconView = [[UCTransitIconView alloc] initWithLine:line];
    iconView.frame = CGRectMake(10.f, 20.f, 100.f, 100.f);
    [self.view addSubview:iconView];
}

@end
