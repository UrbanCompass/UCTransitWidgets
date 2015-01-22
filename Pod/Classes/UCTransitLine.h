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

@interface UCTransitLine : NSObject <NSCopying>

- (instancetype)initWithSystem:(UCTransitSystem)system line:(NSString *)line;

@property (nonatomic, readonly) UCTransitSystem system;

@end
