//
//  Created by Jerry Wong on 1/22/15.
//
//

#import <UIKit/UIKit.h>

@interface UIColor (UCTransitColor)

/**
 *  Converts a hex value to a UIColor
 *
 *  @param col a hex value to convert (e.g., 0xffffff)
 *
 *  @return UIColor representing the hex code
 */
+ (UIColor *)colorWithHex:(UInt32)col;

@end
