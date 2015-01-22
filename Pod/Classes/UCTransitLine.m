//
//  UCMTALine.m
//  Pods
//
//  Created by James Paolantonio on 1/22/15.
//
//

#import "UCTransitLine.h"

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
    UCMTALineT // 2nd Ave subway
};

@interface UCTransitLine ()
@property (nonatomic, readwrite) UCTransitSystem system;
@property (nonatomic, assign) NSInteger lineCode;
@end

@implementation UCTransitLine

- (instancetype)initWithSystem:(UCTransitSystem)system line:(NSString *)line {
    self = [super init];
    if (self) {
        self.system = system;
        self.lineCode = [self lineCodeForSystem:system line:line];
        if (self.lineCode == NSNotFound) {
            @throw [NSException exceptionWithName:NSInvalidArgumentException
                                           reason:@"Line code specified does not map to a known line in the system"
                                         userInfo:nil];
        }
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    UCTransitLine *line = [[self class] allocWithZone:zone];
    line.system = self.system;
    line.lineCode = self.lineCode;
    return line;
}

- (NSInteger)lineCodeForSystem:(UCTransitSystem)system line:(NSString *)lineId {
    switch (system) {
        case UCTransitSystemNYCSubway:
            return [self lineCodeForNYLineId:lineId];
            break;
        default:
            return NSNotFound;
            break;
    }
}

- (UCTransitLineNY)lineCodeForNYLineId:(NSString *)lineId {
    NSDictionary *map = @{ @"0" : @(UCMTALine0),
                           @"1" : @(UCMTALine1),
                           @"2" : @(UCMTALine2),
                           @"3" : @(UCMTALine3),
                           @"4" : @(UCMTALine4),
                           @"5" : @(UCMTALine5),
                           @"6" : @(UCMTALine6),
                           @"6X" : @(UCMTALine6X),
                           @"7" : @(UCMTALine7),
                           @"7X" : @(UCMTALine7X),
                           @"A" : @(UCMTALineA),
                           @"B" : @(UCMTALineB),
                           @"C" : @(UCMTALineC),
                           @"D" : @(UCMTALineD),
                           @"E" : @(UCMTALineE),
                           @"F" : @(UCMTALineF),
                           @"G" : @(UCMTALineG),
                           @"HH" : @(UCMTALineHH),
                           @"J" : @(UCMTALineJ),
                           @"L" : @(UCMTALineL),
                           @"M" : @(UCMTALineM),
                           @"N" : @(UCMTALineN),
                           @"Q" : @(UCMTALineQ),
                           @"R" : @(UCMTALineR),
                           @"S" : @(UCMTALineS),
                           @"T" : @(UCMTALineT),
                           };
    NSNumber *line = map[lineId];
    if (line) {
        return [line integerValue];
    }
    return NSNotFound;
}

@end
