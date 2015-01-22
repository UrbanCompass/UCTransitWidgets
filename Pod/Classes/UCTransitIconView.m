//
//  Created by James Paolantonio on 1/22/15.
//

#import "UCTransitIconView.h"

#import "UCTransitLine.h"
#import "UCMTAIconView.h"
#import "UIColor+UCTransitColor.h"

@implementation UCSystemIconView

- (instancetype)initWithLine:(UCTransitLine *)line {
    self = [super init];
    if (self) {
        _line = line;
    }
    return self;
}

@end

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
    if (line.system == UCTransitSystemNYCSubway) {
        return [[UCMTAIconView alloc] initWithLine:line];
    }
    return nil;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    self.iconView.frame = self.bounds;
}

@end
