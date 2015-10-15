//
//  Created by Jerry Wong on 1/22/15.
//

#import <UIKit/UIKit.h>

@class UCTransitLine;

/**
 *  The `UCTransitIconView` class displays transit icons as specified by its `line` parameter. Note that the exact
 *  implementation of displaying the transit line (drawRect, layers, subviews, etc) is specific to the transit line
 *  specified.
 */
@interface UCTransitIconView : UIView

/**
 *  The line to be displayed. This can be changed after instantiation.
 */
@property (nonatomic, copy) UCTransitLine *line;

/**
 *  Creates a new instance of UCTransitIconView
 *
 *  @param line the line to display
 *
 *  @return UCTransitIconView instance
 */
- (instancetype)initWithLine:(UCTransitLine *)line;

@end
