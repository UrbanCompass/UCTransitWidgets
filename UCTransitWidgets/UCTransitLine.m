//
//  UCMTALine.m
//  Pods
//
//  Created by James Paolantonio on 1/22/15.
//
//

#import "UCTransitLine.h"

NSString * const UCTransitSystemDomain = @"UCTransitSystemDomain";

@interface UCTransitLine ()
@property (nonatomic, readwrite) UCTransitSystem system;
@property (nonatomic, readwrite) NSInteger lineCode;

@end

@implementation UCTransitLine

- (instancetype)initWithSystem:(UCTransitSystem)system line:(NSString *)line error:(out NSError **)error {
    self = [super init];
    if (self) {
        _system = system;
        _lineCode = [self lineCodeForSystem:system line:line];
        if (self.lineCode == NSNotFound) {
            *error = [NSError errorWithDomain:UCTransitSystemDomain
                                         code:UCTransitErrorCodeLineDoesNotExist
                                     userInfo:@{
                                                @"System" : @(system),
                                                @"LineCode" : @(_lineCode)
                                                }];
            return nil;
        }
    }
    return self;
}

- (instancetype)initWithSystem:(UCTransitSystem)system line:(NSString *)line {
    self = [super init];
    if (self) {
        _system = system;
        _lineCode = [self lineCodeForSystem:system line:line];
        if (self.lineCode == NSNotFound) {
            @throw [NSException exceptionWithName:NSInvalidArgumentException
                                           reason:@"Line code specified does not map to a known line in the system"
                                         userInfo:@{
                                                    @"System" : @(system),
                                                    @"LineCode" : @(_lineCode)
                                                    }];
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
        case UCTransitSystemDCMetroRail:
            return [self lineCodeForDCRailLineId:lineId];
            break;
        case UCTransitSystemDCMetroBus:
            return [self lineCodeForDCBusLineId:lineId];
            break;
        default:
            return NSNotFound;
            break;
    }
}

- (UCTransitLineNY)lineCodeForNYLineId:(NSString *)lineId {
    NSDictionary *map = @{ @"0" : @(UCMTALine0),
                           @"GS": @(UCMTALine0), // the GCT shuttle is called GS in some station feeds
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
                           @"H" : @(UCMTALineHH), // the Rockaway shuttle is called H in some station feeds
                           @"J" : @(UCMTALineJ),
                           @"L" : @(UCMTALineL),
                           @"M" : @(UCMTALineM),
                           @"N" : @(UCMTALineN),
                           @"Q" : @(UCMTALineQ),
                           @"R" : @(UCMTALineR),
                           @"S" : @(UCMTALineS),
                           @"FS" : @(UCMTALineS), // the Franklin Shuttle is called FS in some station feeds
                           @"T" : @(UCMTALineT),
                           @"Z" : @(UCMTALineZ),
                           };
    NSNumber *line = map[lineId];
    if (line) {
        return [line integerValue];
    }
    return NSNotFound;
}

- (UCTransitLineWMTARail)lineCodeForDCRailLineId:(NSString *)lineId {
    NSDictionary *map = @{ @"RD" : @(UCWMTARed),
                           @"OR" : @(UCWMTAOrange),
                           @"SV" : @(UCWMTASilver),
                           @"BL" : @(UCWMTABlue),
                           @"YL" : @(UCWMTAYellow),
                           @"GR" : @(UCWMTAGreen),
                           @"PU" : @(UCWMTAPurple),
                           };
    NSNumber *line = map[lineId];
    if (line) {
        return [line integerValue];
    }
    return NSNotFound;
}

- (UCTransitLineWMTARail)lineCodeForDCBusLineId:(NSString *)lineId {
    NSDictionary *map = @{ @"10A" : @(UCWMTA10A),
                           @"10B" : @(UCWMTA10B),
                           @"10E" : @(UCWMTA10E),
                           @"10R" : @(UCWMTA10R),
                           @"10S" : @(UCWMTA10S),
                           @"11Y" : @(UCWMTA11Y),
                           @"13Y" : @(UCWMTA13Y),
                           @"15K" : @(UCWMTA15K),
                           @"15L" : @(UCWMTA15L),
                           @"15M" : @(UCWMTA15M),
                           @"16A" : @(UCWMTA16A),
                           @"16B" : @(UCWMTA16B),
                           @"16D" : @(UCWMTA16D),
                           @"16E" : @(UCWMTA16E),
                           @"16G" : @(UCWMTA16G),
                           @"16H" : @(UCWMTA16H),
                           @"16J" : @(UCWMTA16J),
                           @"16K" : @(UCWMTA16K),
                           @"16L" : @(UCWMTA16L),
                           @"16P" : @(UCWMTA16P),
                           @"16X" : @(UCWMTA16X),
                           @"16Y" : @(UCWMTA16Y),
                           @"17A" : @(UCWMTA17A),
                           @"17B" : @(UCWMTA17B),
                           @"17F" : @(UCWMTA17F),
                           @"17G" : @(UCWMTA17G),
                           @"17H" : @(UCWMTA17H),
                           @"17K" : @(UCWMTA17K),
                           @"17L" : @(UCWMTA17L),
                           @"17M" : @(UCWMTA17M),
                           @"18E" : @(UCWMTA18E),
                           @"18F" : @(UCWMTA18F),
                           @"18G" : @(UCWMTA18G),
                           @"18H" : @(UCWMTA18H),
                           @"18J" : @(UCWMTA18J),
                           @"18P" : @(UCWMTA18P),
                           @"18R" : @(UCWMTA18R),
                           @"18S" : @(UCWMTA18S),
                           @"1A" : @(UCWMTA1A),
                           @"1B" : @(UCWMTA1B),
                           @"1C" : @(UCWMTA1C),
                           @"1E" : @(UCWMTA1E),
                           @"1Z" : @(UCWMTA1Z),
                           @"21A" : @(UCWMTA21A),
                           @"21D" : @(UCWMTA21D),
                           @"22A" : @(UCWMTA22A),
                           @"22B" : @(UCWMTA22B),
                           @"23A" : @(UCWMTA23A),
                           @"23B" : @(UCWMTA23B),
                           @"23T" : @(UCWMTA23T),
                           @"25A" : @(UCWMTA25A),
                           @"25B" : @(UCWMTA25B),
                           @"25C" : @(UCWMTA25C),
                           @"25D" : @(UCWMTA25D),
                           @"25E" : @(UCWMTA25E),
                           @"26A" : @(UCWMTA26A),
                           @"28A" : @(UCWMTA28A),
                           @"28F" : @(UCWMTA28F),
                           @"28G" : @(UCWMTA28G),
                           @"28X" : @(UCWMTA28X),
                           @"29C" : @(UCWMTA29C),
                           @"29E" : @(UCWMTA29E),
                           @"29G" : @(UCWMTA29G),
                           @"29H" : @(UCWMTA29H),
                           @"29K" : @(UCWMTA29K),
                           @"29N" : @(UCWMTA29N),
                           @"29X" : @(UCWMTA29X),
                           @"2A" : @(UCWMTA2A),
                           @"2B" : @(UCWMTA2B),
                           @"2T" : @(UCWMTA2T),
                           @"30N" : @(UCWMTA30N),
                           @"30S" : @(UCWMTA30S),
                           @"31" : @(UCWMTA31),
                           @"32" : @(UCWMTA32),
                           @"33" : @(UCWMTA33),
                           @"34" : @(UCWMTA34),
                           @"36" : @(UCWMTA36),
                           @"37" : @(UCWMTA37),
                           @"38B" : @(UCWMTA38B),
                           @"39" : @(UCWMTA39),
                           @"3A" : @(UCWMTA3A),
                           @"3T" : @(UCWMTA3T),
                           @"3Y" : @(UCWMTA3Y),
                           @"42" : @(UCWMTA42),
                           @"43" : @(UCWMTA43),
                           @"4A" : @(UCWMTA4A),
                           @"4B" : @(UCWMTA4B),
                           @"52" : @(UCWMTA52),
                           @"53" : @(UCWMTA53),
                           @"54" : @(UCWMTA54),
                           @"5A" : @(UCWMTA5A),
                           @"60" : @(UCWMTA60),
                           @"62" : @(UCWMTA62),
                           @"63" : @(UCWMTA63),
                           @"64" : @(UCWMTA64),
                           @"70" : @(UCWMTA70),
                           @"74" : @(UCWMTA74),
                           @"79" : @(UCWMTA79),
                           @"7A" : @(UCWMTA7A),
                           @"7B" : @(UCWMTA7B),
                           @"7C" : @(UCWMTA7C),
                           @"7F" : @(UCWMTA7F),
                           @"7H" : @(UCWMTA7H),
                           @"7M" : @(UCWMTA7M),
                           @"7P" : @(UCWMTA7P),
                           @"7W" : @(UCWMTA7W),
                           @"7X" : @(UCWMTA7X),
                           @"7Y" : @(UCWMTA7Y),
                           @"80" : @(UCWMTA80),
                           @"81" : @(UCWMTA81),
                           @"82" : @(UCWMTA82),
                           @"83" : @(UCWMTA83),
                           @"86" : @(UCWMTA86),
                           @"87" : @(UCWMTA87),
                           @"89" : @(UCWMTA89),
                           @"89M" : @(UCWMTA89M),
                           @"8S" : @(UCWMTA8S),
                           @"8W" : @(UCWMTA8W),
                           @"8Z" : @(UCWMTA8Z),
                           @"90" : @(UCWMTA90),
                           @"92" : @(UCWMTA92),
                           @"93" : @(UCWMTA93),
                           @"94" : @(UCWMTA94),
                           @"96" : @(UCWMTA96),
                           @"97" : @(UCWMTA97),
                           @"9A" : @(UCWMTA9A),
                           @"A11" : @(UCWMTAA11),
                           @"A12" : @(UCWMTAA12),
                           @"A2" : @(UCWMTAA2),
                           @"A31" : @(UCWMTAA31),
                           @"A32" : @(UCWMTAA32),
                           @"A33" : @(UCWMTAA33),
                           @"A4" : @(UCWMTAA4),
                           @"A42" : @(UCWMTAA42),
                           @"A46" : @(UCWMTAA46),
                           @"A48" : @(UCWMTAA48),
                           @"A6" : @(UCWMTAA6),
                           @"A7" : @(UCWMTAA7),
                           @"A8" : @(UCWMTAA8),
                           @"A9" : @(UCWMTAA9),
                           @"B2" : @(UCWMTAB2),
                           @"B21" : @(UCWMTAB21),
                           @"B22" : @(UCWMTAB22),
                           @"B24" : @(UCWMTAB24),
                           @"B25" : @(UCWMTAB25),
                           @"B27" : @(UCWMTAB27),
                           @"B29" : @(UCWMTAB29),
                           @"B30" : @(UCWMTAB30),
                           @"B31" : @(UCWMTAB31),
                           @"B51" : @(UCWMTAB51),
                           @"B8" : @(UCWMTAB8),
                           @"B9" : @(UCWMTAB9),
                           @"C11" : @(UCWMTAC11),
                           @"C12" : @(UCWMTAC12),
                           @"C13" : @(UCWMTAC13),
                           @"C14" : @(UCWMTAC14),
                           @"C2" : @(UCWMTAC2),
                           @"C21" : @(UCWMTAC21),
                           @"C22" : @(UCWMTAC22),
                           @"C26" : @(UCWMTAC26),
                           @"C27" : @(UCWMTAC27),
                           @"C28" : @(UCWMTAC28),
                           @"C29" : @(UCWMTAC29),
                           @"C4" : @(UCWMTAC4),
                           @"C40" : @(UCWMTAC40),
                           @"C8" : @(UCWMTAC8),
                           @"D1" : @(UCWMTAD1),
                           @"D12" : @(UCWMTAD12),
                           @"D13" : @(UCWMTAD13),
                           @"D14" : @(UCWMTAD14),
                           @"D2" : @(UCWMTAD2),
                           @"D3" : @(UCWMTAD3),
                           @"D31" : @(UCWMTAD31),
                           @"D32" : @(UCWMTAD32),
                           @"D33" : @(UCWMTAD33),
                           @"D34" : @(UCWMTAD34),
                           @"D4" : @(UCWMTAD4),
                           @"D5" : @(UCWMTAD5),
                           @"D51" : @(UCWMTAD51),
                           @"D6" : @(UCWMTAD6),
                           @"D8" : @(UCWMTAD8),
                           @"E2" : @(UCWMTAE2),
                           @"E3" : @(UCWMTAE3),
                           @"E32" : @(UCWMTAE32),
                           @"E4" : @(UCWMTAE4),
                           @"E6" : @(UCWMTAE6),
                           @"F1" : @(UCWMTAF1),
                           @"F12" : @(UCWMTAF12),
                           @"F13" : @(UCWMTAF13),
                           @"F14" : @(UCWMTAF14),
                           @"F2" : @(UCWMTAF2),
                           @"F4" : @(UCWMTAF4),
                           @"F6" : @(UCWMTAF6),
                           @"F8" : @(UCWMTAF8),
                           @"G12" : @(UCWMTAG12),
                           @"G13" : @(UCWMTAG13),
                           @"G14" : @(UCWMTAG14),
                           @"G16" : @(UCWMTAG16),
                           @"G2" : @(UCWMTAG2),
                           @"G8" : @(UCWMTAG8),
                           @"H1" : @(UCWMTAH1),
                           @"H11" : @(UCWMTAH11),
                           @"H12" : @(UCWMTAH12),
                           @"H13" : @(UCWMTAH13),
                           @"H2" : @(UCWMTAH2),
                           @"H3" : @(UCWMTAH3),
                           @"H4" : @(UCWMTAH4),
                           @"H6" : @(UCWMTAH6),
                           @"H8" : @(UCWMTAH8),
                           @"H9" : @(UCWMTAH9),
                           @"J1" : @(UCWMTAJ1),
                           @"J11" : @(UCWMTAJ11),
                           @"J12" : @(UCWMTAJ12),
                           @"J13" : @(UCWMTAJ13),
                           @"J2" : @(UCWMTAJ2),
                           @"J3" : @(UCWMTAJ3),
                           @"J4" : @(UCWMTAJ4),
                           @"J5" : @(UCWMTAJ5),
                           @"J7" : @(UCWMTAJ7),
                           @"J9" : @(UCWMTAJ9),
                           @"K11" : @(UCWMTAK11),
                           @"K12" : @(UCWMTAK12),
                           @"K13" : @(UCWMTAK13),
                           @"K2" : @(UCWMTAK2),
                           @"K6" : @(UCWMTAK6),
                           @"K9" : @(UCWMTAK9),
                           @"L1" : @(UCWMTAL1),
                           @"L2" : @(UCWMTAL2),
                           @"L8" : @(UCWMTAL8),
                           @"M31" : @(UCWMTAM31),
                           @"M4" : @(UCWMTAM4),
                           @"M6" : @(UCWMTAM6),
                           @"MWY" : @(UCWMTAMWY),
                           @"N2" : @(UCWMTAN2),
                           @"N3" : @(UCWMTAN3),
                           @"N4" : @(UCWMTAN4),
                           @"N6" : @(UCWMTAN6),
                           @"NH1" : @(UCWMTANH1),
                           @"NH3" : @(UCWMTANH3),
                           @"P12" : @(UCWMTAP12),
                           @"P17" : @(UCWMTAP17),
                           @"P18" : @(UCWMTAP18),
                           @"P19" : @(UCWMTAP19),
                           @"P6" : @(UCWMTAP6),
                           @"Q1" : @(UCWMTAQ1),
                           @"Q2" : @(UCWMTAQ2),
                           @"Q4" : @(UCWMTAQ4),
                           @"Q5" : @(UCWMTAQ5),
                           @"Q6" : @(UCWMTAQ6),
                           @"R1" : @(UCWMTAR1),
                           @"R11" : @(UCWMTAR11),
                           @"R12" : @(UCWMTAR12),
                           @"R2" : @(UCWMTAR2),
                           @"R3" : @(UCWMTAR3),
                           @"R4" : @(UCWMTAR4),
                           @"REX" : @(UCWMTAREX),
                           @"S1" : @(UCWMTAS1),
                           @"S2" : @(UCWMTAS2),
                           @"S35" : @(UCWMTAS35),
                           @"S4" : @(UCWMTAS4),
                           @"S41" : @(UCWMTAS41),
                           @"S80" : @(UCWMTAS80),
                           @"S9" : @(UCWMTAS9),
                           @"S91" : @(UCWMTAS91),
                           @"T14" : @(UCWMTAT14),
                           @"T18" : @(UCWMTAT18),
                           @"T2" : @(UCWMTAT2),
                           @"U2" : @(UCWMTAU2),
                           @"U4" : @(UCWMTAU4),
                           @"U5" : @(UCWMTAU5),
                           @"U6" : @(UCWMTAU6),
                           @"U8" : @(UCWMTAU8),
                           @"V12" : @(UCWMTAV12),
                           @"V14" : @(UCWMTAV14),
                           @"V15" : @(UCWMTAV15),
                           @"V5" : @(UCWMTAV5),
                           @"V7" : @(UCWMTAV7),
                           @"V8" : @(UCWMTAV8),
                           @"V9" : @(UCWMTAV9),
                           @"W1" : @(UCWMTAW1),
                           @"W13" : @(UCWMTAW13),
                           @"W14" : @(UCWMTAW14),
                           @"W15" : @(UCWMTAW15),
                           @"W19" : @(UCWMTAW19),
                           @"W2" : @(UCWMTAW2),
                           @"W3" : @(UCWMTAW3),
                           @"W4" : @(UCWMTAW4),
                           @"W45" : @(UCWMTAW45),
                           @"W47" : @(UCWMTAW47),
                           @"W5" : @(UCWMTAW5),
                           @"W6" : @(UCWMTAW6),
                           @"W8" : @(UCWMTAW8),
                           @"W9" : @(UCWMTAW9),
                           @"X1" : @(UCWMTAX1),
                           @"X2" : @(UCWMTAX2),
                           @"X3" : @(UCWMTAX3),
                           @"X8" : @(UCWMTAX8),
                           @"X9" : @(UCWMTAX9),
                           @"Y2" : @(UCWMTAY2),
                           @"Y7" : @(UCWMTAY7),
                           @"Y8" : @(UCWMTAY8),
                           @"Z11" : @(UCWMTAZ11),
                           @"Z13" : @(UCWMTAZ13),
                           @"Z2" : @(UCWMTAZ2),
                           @"Z29" : @(UCWMTAZ29),
                           @"Z6" : @(UCWMTAZ6),
                           @"Z8" : @(UCWMTAZ8),
                           @"Z9" : @(UCWMTAZ9),
                           };
    NSNumber *line = map[lineId];
    if (line) {
        return [line integerValue];
    }
    return NSNotFound;
}

@end
