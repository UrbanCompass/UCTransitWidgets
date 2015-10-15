//
//  UCTransitWidgetsTests.m
//  UCTransitWidgetsTests
//
//  Created by James Paolantonio on 10/15/15.
//  Copyright © 2015 Compass. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "UCTransitWidgets.h"

@interface UCTransitWidgetsTests : XCTestCase

@end

@implementation UCTransitWidgetsTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testIconCreation {
    UCTransitSystem system = UCTransitSystemNYCSubway;
    UCTransitLine *line = [[UCTransitLine alloc] initWithSystem:system line:@"D"];
    UCTransitIconView *iconView = [[UCTransitIconView alloc] initWithLine:line];

    XCTAssertNotNil(iconView);
}
@end
