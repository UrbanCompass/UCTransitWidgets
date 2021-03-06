//
//  Created by James Paolantonio on 1/22/15.
//

#import "UCTransitIconView.h"

#import "UCTransitLine.h"
#import "UCMTAIconView.h"
#import "UCWMTAIconView.h"
#import "UCWMTABusIconView.h"
#import "UIColor+UCTransitColor.h"

@interface UCTransitIconView ()
@property (nonatomic) UCSystemIconView *iconView;
@end

@implementation UCTransitIconView

- (instancetype)initWithLine:(UCTransitLine *)line {
    self = [super init];
    if (self) {
        self.line = line;
        [self addSubview:self.iconView];
    }
    return self;
}

- (void)setLine:(UCTransitLine *)line {
    _line = line;
    if (self.iconView) {
        [self.iconView removeFromSuperview];
    }
    self.iconView = [self iconViewForLine:line];
    [self addSubview:self.iconView];
    [self setNeedsLayout];
}

- (UCSystemIconView *)iconViewForLine:(UCTransitLine *)line {
    switch (line.system) {
        case UCTransitSystemDCMetroRail:
            return [[UCWMTAIconView alloc] initWithLine:line];
            break;
        case UCTransitSystemDCMetroBus:
            return [[UCWMTABusIconView alloc] initWithLine:line];
            break;
        case UCTransitSystemNYCSubway:
            return [[UCMTAIconView alloc] initWithLine:line];
            break;
        default:
            break;
    }
    return nil;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    self.iconView.frame = self.bounds;
}

@end
