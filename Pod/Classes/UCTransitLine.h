//
//  UCTransitLine.h
//  Pods
//
//  Created by James Paolantonio on 1/22/15.
//
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, UCTransitSystem) {
    UCTransitSystemDCMetro,
    UCTransitSystemNYCSubway,
};

typedef NS_ENUM(NSInteger, UCTransitLineNY) {
    UCMTALine1 = 0,
    UCMTALine2,
    UCMTALine3,
    UCMTALine4,
    UCMTALine5,
    UCMTALine6,
    UCMTALine6X, // 6 Express
    UCMTALine7,
    UCMTALine7X, // 7 Express
    UCMTALineA,
    UCMTALineB,
    UCMTALineC,
    UCMTALineD,
    UCMTALineE,
    UCMTALineF,
    UCMTALineG,
    UCMTALineJ,
    UCMTALineL,
    UCMTALineM,
    UCMTALineN,
    UCMTALineQ,
    UCMTALineR,
    UCMTALineS, // Franklin shuttle
    UCMTALineHH, // Rockaway shuttle
    UCMTALine0, // 42nd St shuttle
    UCMTALineT, // 2nd Ave subway
    UCMTALineZ
};

typedef NS_ENUM(NSInteger, UCTransitLineWMTA) {
    UCWMTARed = 0,
    UCWMTAOrange,
    UCWMTASilver,
    UCWMTABlue,
    UCWMTAYellow,
    UCWMTAGreen,
    UCWMTAPurple
};

@interface UCTransitLine : NSObject <NSCopying>

- (instancetype)initWithSystem:(UCTransitSystem)system line:(NSString *)line;

@property (nonatomic, readonly) UCTransitSystem system;
@property (nonatomic, readonly) NSInteger lineCode;

@end
