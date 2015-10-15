//
//  UCSystemIconView.h
//  Pods
//
//  Created by Jerry Wong on 1/22/15.
//
//

#import <UIKit/UIKit.h>

@class UCTransitLine;

/**
 *  UCSystemIconView is the base class for all icon views. It should not be instantiated directly by consumers of
 *  UCTransitWidgets, and should be subclassed to implement additional agencies or transportation systems.
 *
 *  @warning Do not instantiate UCSystemIconView by itself, it is intended as a base class.
 */
@interface UCSystemIconView : UIView

/**
 *  The line to display, this property is read only.
 */
@property (nonatomic, readonly) UCTransitLine *line;

/**
 *  Creates a new instance of UCSystemIconView with a specified line
 *
 *  @param line the transit line to display
 *
 *  @return UCSystemIconView instance
 */
- (instancetype)initWithLine:(UCTransitLine *)line;

@end
