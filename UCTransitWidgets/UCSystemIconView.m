//
//  UCSystemIconView.m
//  Pods
//
//  Created by Jerry Wong on 1/22/15.
//
//

#import "UCSystemIconView.h"

#import "UCTransitLine.h"

@implementation UCSystemIconView

- (instancetype)initWithLine:(UCTransitLine *)line {
    self = [super init];
    if (self) {
        _line = line;
        self.opaque = NO;
    }
    return self;
}

@end