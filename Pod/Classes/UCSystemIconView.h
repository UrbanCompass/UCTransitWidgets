//
//  UCSystemIconView.h
//  Pods
//
//  Created by Jerry Wong on 1/22/15.
//
//

#import <UIKit/UIKit.h>

@class UCTransitLine;

@interface UCSystemIconView : UIView
@property (nonatomic, readonly) UCTransitLine *line;
- (instancetype)initWithLine:(UCTransitLine *)line;
@end
