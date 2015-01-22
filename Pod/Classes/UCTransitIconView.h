//
//  Created by Jerry Wong on 1/22/15.
//

#import <UIKit/UIKit.h>

@class UCTransitLine;

@interface UCTransitIconView : UIView
@property (nonatomic, copy) UCTransitLine *line;
- (instancetype)initWithLine:(UCTransitLine *)line;
@end
