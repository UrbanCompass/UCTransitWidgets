//
//  UCTransitLine.h
//  Pods
//
//  Created by James Paolantonio on 1/22/15.
//
//

#import <Foundation/Foundation.h>

extern NSString * const UCTransitSystemDomain;

typedef NS_ENUM(NSUInteger, UCTransitErrorCode) {
    UCTransitErrorCodeUnknown = 0,
    UCTransitErrorCodeLineDoesNotExist
};

typedef NS_ENUM(NSUInteger, UCTransitSystem) {
    /**
     *  DC Metro Rail
     */
    UCTransitSystemDCMetroRail = 0,
    /**
     *  DC Metro Bus
     */
    UCTransitSystemDCMetroBus,
    /**
     *  NYC Subway
     */
    UCTransitSystemNYCSubway,
};

typedef NS_ENUM(NSInteger, UCTransitLineNY) {
    /**
     *  1 Train - IRT 7th Ave Line
     */
    UCMTALine1 = 0,
    /**
     *  2 Train - IRT 7th Ave Line
     */
    UCMTALine2,
    /**
     *  3 Train - IRT 7th Ave Line
     */
    UCMTALine3,
    /**
     *  4 Train - IRT Lexington Ave Line
     */
    UCMTALine4,
    /**
     *  5 Train - IRT Lexington Ave Line
     */
    UCMTALine5,
    /**
     *  5 Train - IRT Lexington Ave Line
     */
    UCMTALine6,
    /**
     *  6 Express Train - IRT Lexington Ave Line
     */
    UCMTALine6X,
    /**
     *  7 Train - IRT Flushing Line
     */
    UCMTALine7,
    /**
     *  7 Express Train - IRT Flushing Line
     */
    UCMTALine7X,
    /**
     *  A Train - IND 8th Ave Line
     */
    UCMTALineA,
    /**
     *  B Train - IND 6th Ave Line
     */
    UCMTALineB,
    /**
     *  C Train - IND 8th Ave Line
     */
    UCMTALineC,
    /**
     *  D Train - IND 6th Ave Line
     */
    UCMTALineD,
    /**
     *  E Train - IND 8th Ave Line
     */
    UCMTALineE,
    /**
     *  F Train - IND 6th Ave Line
     */
    UCMTALineF,
    /**
     *  G Train - IND Crosstown Line
     */
    UCMTALineG,
    /**
     *  J Train - BMT Nassau Line
     */
    UCMTALineJ,
    /**
     *  L Train - BMT Canarsie Line
     */
    UCMTALineL,
    /**
     *  M Train - IND 6th Ave Line
     */
    UCMTALineM,
    /**
     *  N Train - BMT Broadway Line
     */
    UCMTALineN,
    /**
     *  N Train - BMT Broadway Line
     */
    UCMTALineQ,
    /**
     *  N Train - BMT Broadway Line
     */
    UCMTALineR,
    /**
     *  Franklin Avenue Shuttle (some APIs confuse this with the other shuttle lines)
     */
    UCMTALineS,
    /**
     *  Rockaway Park Shuttle
     */
    UCMTALineHH,
    /**
     *  42nd St Shuttle (some APIs specify this line as "S")
     */
    UCMTALine0,
    /**
     *  T Train - 2nd Ave Subway (does not actually exist yet, reserved for future use)
     */
    UCMTALineT,
    /**
     *  Z Train - BMT Nassau Line
     */
    UCMTALineZ
};

typedef NS_ENUM(NSInteger, UCTransitLineWMTARail) {
    UCWMTARed = 0,
    UCWMTAOrange,
    UCWMTASilver,
    UCWMTABlue,
    UCWMTAYellow,
    UCWMTAGreen,
    UCWMTAPurple
};

typedef NS_ENUM(NSInteger, UCTransitLineWMTABus) {
    UCWMTA10A = 0,
    UCWMTA10B,
    UCWMTA10E,
    UCWMTA10R,
    UCWMTA10S,
    UCWMTA11Y,
    UCWMTA13Y,
    UCWMTA15K,
    UCWMTA15L,
    UCWMTA15M,
    UCWMTA16A,
    UCWMTA16B,
    UCWMTA16D,
    UCWMTA16E,
    UCWMTA16G,
    UCWMTA16H,
    UCWMTA16J,
    UCWMTA16K,
    UCWMTA16L,
    UCWMTA16P,
    UCWMTA16X,
    UCWMTA16Y,
    UCWMTA17A,
    UCWMTA17B,
    UCWMTA17F,
    UCWMTA17G,
    UCWMTA17H,
    UCWMTA17K,
    UCWMTA17L,
    UCWMTA17M,
    UCWMTA18E,
    UCWMTA18F,
    UCWMTA18G,
    UCWMTA18H,
    UCWMTA18J,
    UCWMTA18P,
    UCWMTA18R,
    UCWMTA18S,
    UCWMTA1A,
    UCWMTA1B,
    UCWMTA1C,
    UCWMTA1E,
    UCWMTA1Z,
    UCWMTA21A,
    UCWMTA21D,
    UCWMTA22A,
    UCWMTA22B,
    UCWMTA23A,
    UCWMTA23B,
    UCWMTA23T,
    UCWMTA25A,
    UCWMTA25B,
    UCWMTA25C,
    UCWMTA25D,
    UCWMTA25E,
    UCWMTA26A,
    UCWMTA28A,
    UCWMTA28F,
    UCWMTA28G,
    UCWMTA28X,
    UCWMTA29C,
    UCWMTA29E,
    UCWMTA29G,
    UCWMTA29H,
    UCWMTA29K,
    UCWMTA29N,
    UCWMTA29X,
    UCWMTA2A,
    UCWMTA2B,
    UCWMTA2T,
    UCWMTA30N,
    UCWMTA30S,
    UCWMTA31,
    UCWMTA32,
    UCWMTA33,
    UCWMTA34,
    UCWMTA36,
    UCWMTA37,
    UCWMTA38B,
    UCWMTA39,
    UCWMTA3A,
    UCWMTA3T,
    UCWMTA3Y,
    UCWMTA42,
    UCWMTA43,
    UCWMTA4A,
    UCWMTA4B,
    UCWMTA52,
    UCWMTA53,
    UCWMTA54,
    UCWMTA5A,
    UCWMTA60,
    UCWMTA62,
    UCWMTA63,
    UCWMTA64,
    UCWMTA70,
    UCWMTA74,
    UCWMTA79,
    UCWMTA7A,
    UCWMTA7B,
    UCWMTA7C,
    UCWMTA7F,
    UCWMTA7H,
    UCWMTA7M,
    UCWMTA7P,
    UCWMTA7W,
    UCWMTA7X,
    UCWMTA7Y,
    UCWMTA80,
    UCWMTA81,
    UCWMTA82,
    UCWMTA83,
    UCWMTA86,
    UCWMTA87,
    UCWMTA89,
    UCWMTA89M,
    UCWMTA8S,
    UCWMTA8W,
    UCWMTA8Z,
    UCWMTA90,
    UCWMTA92,
    UCWMTA93,
    UCWMTA94,
    UCWMTA96,
    UCWMTA97,
    UCWMTA9A,
    UCWMTAA11,
    UCWMTAA12,
    UCWMTAA2,
    UCWMTAA31,
    UCWMTAA32,
    UCWMTAA33,
    UCWMTAA4,
    UCWMTAA42,
    UCWMTAA46,
    UCWMTAA48,
    UCWMTAA6,
    UCWMTAA7,
    UCWMTAA8,
    UCWMTAA9,
    UCWMTAB2,
    UCWMTAB21,
    UCWMTAB22,
    UCWMTAB24,
    UCWMTAB25,
    UCWMTAB27,
    UCWMTAB29,
    UCWMTAB30,
    UCWMTAB31,
    UCWMTAB51,
    UCWMTAB8,
    UCWMTAB9,
    UCWMTAC11,
    UCWMTAC12,
    UCWMTAC13,
    UCWMTAC14,
    UCWMTAC2,
    UCWMTAC21,
    UCWMTAC22,
    UCWMTAC26,
    UCWMTAC27,
    UCWMTAC28,
    UCWMTAC29,
    UCWMTAC4,
    UCWMTAC40,
    UCWMTAC8,
    UCWMTAD1,
    UCWMTAD12,
    UCWMTAD13,
    UCWMTAD14,
    UCWMTAD2,
    UCWMTAD3,
    UCWMTAD31,
    UCWMTAD32,
    UCWMTAD33,
    UCWMTAD34,
    UCWMTAD4,
    UCWMTAD5,
    UCWMTAD51,
    UCWMTAD6,
    UCWMTAD8,
    UCWMTAE2,
    UCWMTAE3,
    UCWMTAE32,
    UCWMTAE4,
    UCWMTAE6,
    UCWMTAF1,
    UCWMTAF12,
    UCWMTAF13,
    UCWMTAF14,
    UCWMTAF2,
    UCWMTAF4,
    UCWMTAF6,
    UCWMTAF8,
    UCWMTAG12,
    UCWMTAG13,
    UCWMTAG14,
    UCWMTAG16,
    UCWMTAG2,
    UCWMTAG8,
    UCWMTAH1,
    UCWMTAH11,
    UCWMTAH12,
    UCWMTAH13,
    UCWMTAH2,
    UCWMTAH3,
    UCWMTAH4,
    UCWMTAH6,
    UCWMTAH8,
    UCWMTAH9,
    UCWMTAJ1,
    UCWMTAJ11,
    UCWMTAJ12,
    UCWMTAJ13,
    UCWMTAJ2,
    UCWMTAJ3,
    UCWMTAJ4,
    UCWMTAJ5,
    UCWMTAJ7,
    UCWMTAJ9,
    UCWMTAK11,
    UCWMTAK12,
    UCWMTAK13,
    UCWMTAK2,
    UCWMTAK6,
    UCWMTAK9,
    UCWMTAL1,
    UCWMTAL2,
    UCWMTAL8,
    UCWMTAM31,
    UCWMTAM4,
    UCWMTAM6,
    UCWMTAMWY,
    UCWMTAN2,
    UCWMTAN3,
    UCWMTAN4,
    UCWMTAN6,
    UCWMTANH1,
    UCWMTANH3,
    UCWMTAP12,
    UCWMTAP17,
    UCWMTAP18,
    UCWMTAP19,
    UCWMTAP6,
    UCWMTAQ1,
    UCWMTAQ2,
    UCWMTAQ4,
    UCWMTAQ5,
    UCWMTAQ6,
    UCWMTAR1,
    UCWMTAR11,
    UCWMTAR12,
    UCWMTAR2,
    UCWMTAR3,
    UCWMTAR4,
    UCWMTAREX,
    UCWMTAS1,
    UCWMTAS2,
    UCWMTAS35,
    UCWMTAS4,
    UCWMTAS41,
    UCWMTAS80,
    UCWMTAS9,
    UCWMTAS91,
    UCWMTAT14,
    UCWMTAT18,
    UCWMTAT2,
    UCWMTAU2,
    UCWMTAU4,
    UCWMTAU5,
    UCWMTAU6,
    UCWMTAU8,
    UCWMTAV12,
    UCWMTAV14,
    UCWMTAV15,
    UCWMTAV5,
    UCWMTAV7,
    UCWMTAV8,
    UCWMTAV9,
    UCWMTAW1,
    UCWMTAW13,
    UCWMTAW14,
    UCWMTAW15,
    UCWMTAW19,
    UCWMTAW2,
    UCWMTAW3,
    UCWMTAW4,
    UCWMTAW45,
    UCWMTAW47,
    UCWMTAW5,
    UCWMTAW6,
    UCWMTAW8,
    UCWMTAW9,
    UCWMTAX1,
    UCWMTAX2,
    UCWMTAX3,
    UCWMTAX8,
    UCWMTAX9,
    UCWMTAY2,
    UCWMTAY7,
    UCWMTAY8,
    UCWMTAZ11,
    UCWMTAZ13,
    UCWMTAZ2,
    UCWMTAZ29,
    UCWMTAZ6,
    UCWMTAZ8,
    UCWMTAZ9,
};

@interface UCTransitLine : NSObject <NSCopying>

/**
 *  Creates a UCTransitLine instance based on system and line with the system. Returns nil with appropriate error
 *  if the specified system/line combination cannot be created.
 *
 *  @param system the transit system
 *  @param line   the train/bus/transit line within the system
 *  @param error  error pointer
 *
 *  @return A UCTransitLine instance, or nil
 */
- (instancetype)initWithSystem:(UCTransitSystem)system line:(NSString *)line error:(out NSError **)error;

/**
 *  Creates a UCTransitLine instance based on system and line within the system. Throws an NSInvalidArgumentException
 *  if the specified system/line combination is not valid.
 *
 *  @param system the transit system
 *  @param line   the train/bus/transit line within the system
 *
 *  @return A UCTransitLine instance
 */
- (instancetype)initWithSystem:(UCTransitSystem)system line:(NSString *)line;

@property (nonatomic, readonly) UCTransitSystem system;
@property (nonatomic, readonly) NSInteger lineCode;

@end
