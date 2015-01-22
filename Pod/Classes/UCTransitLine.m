//
//  UCMTALine.m
//  Pods
//
//  Created by James Paolantonio on 1/22/15.
//
//

#import "UCTransitLine.h"

@interface UCTransitLine ()
@property (nonatomic, readwrite) UCTransitSystem system;
@property (nonatomic, readwrite) NSInteger lineCode;

@end

@implementation UCTransitLine

- (instancetype)initWithSystem:(UCTransitSystem)system line:(NSString *)line {
    self = [super init];
    if (self) {
        _system = system;
        _lineCode = [self lineCodeForSystem:system line:line];
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
                           @"Z" : @(UCMTALineZ),
                           };
    NSNumber *line = map[lineId];
    if (line) {
        return [line integerValue];
    }
    return NSNotFound;
}

@end
