//
//  UCTransitLine.m
//  Pods
//
//  Created by James Paolantonio on 1/22/15.
//
//

#import "UCTransitLine.h"

//typedef NS_ENUM(NSUInteger, UCTransitLineNY) {
//    UCTransitLine1,
//    UCTransitLine2,
//    UCTransitLine3,
//    UCTransitLine4,
//    UCTransitLine5,
//    UCTransitLine6,
//    UCTransitLine6Express,
//    UCTransitLine7,
//    UCTransitLine7Express,
//    UCTransitLineA,
//    UCTransitLineB,
//    UCTransitLineC,
//    UCTransitLineD,
//    UCTransitLineE,
//    UCTransitLineF,
//    UCTransitLineG,
//    UCTransitLineJ,
//    UCTransitLineL,
//    UCTransitLineM,
//    UCTransitLineN,
//    UCTransitLineQ,
//    UCTransitLineR,
//    UCTransitLineS,
//};

@interface UCTransitLine ()
@property (nonatomic, readwrite) UCTransitSystem system;
@end

@implementation UCTransitLine

- (instancetype)initWithSystem:(UCTransitSystem)system line:(NSString *)line {
    self = [super init];
    if (self) {

    }
    return self;
}

@end
