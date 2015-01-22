//
//  UCWMTAIconView.m
//  Pods
//
//  Created by Jerry Wong on 1/22/15.
//
//

#import "UCWMTAIconView.h"

#import "UIColor+UCTransitColor.h"
#import "UCTransitLine.h"

@interface UCWMTAIconView ()
@property (nonatomic) NSString *displayName;
@end

@implementation UCWMTAIconView

- (instancetype)initWithLine:(UCTransitLine *)line {
    self = [super initWithLine:line];
    if (self) {
        self.displayName = [self displayNameForLine:line.lineCode];
    }
    return self;
}

- (void)setBounds:(CGRect)bounds {
    CGSize origSize = self.bounds.size;
    [super setBounds:bounds];
    if (!CGSizeEqualToSize(bounds.size, origSize)) {
        [self setNeedsDisplay];
    }
}

- (void)setFrame:(CGRect)frame {
    CGSize origSize = self.frame.size;
    [super setFrame:frame];
    if (!CGSizeEqualToSize(frame.size, origSize)) {
        [self setNeedsDisplay];
    }
}

- (UIColor *)displayColorForLine:(UCTransitLineWMTA)line {
    switch (line) {
        case UCWMTARed:
        case UCWMTABlue:
        case UCWMTAGreen:
        case UCWMTAPurple:
            return [UIColor whiteColor];
            break;
        case UCWMTAOrange:
        case UCWMTASilver:
        case UCWMTAYellow:
            return [UIColor blackColor];
            break;
        default:
            return nil;
            break;
    }
}

- (UIColor *)badgeColorForLine:(UCTransitLineWMTA)line {
    switch (line) {
        case UCWMTABlue:
            return [UIColor colorWithHex:0x0096d6];
            break;
        case UCWMTAGreen:
            return [UIColor colorWithHex:0x00b760];
            break;
        case UCWMTAOrange:
            return [UIColor colorWithHex:0xf8971d];
            break;
        case UCWMTARed:
            return [UIColor colorWithHex:0xd11242];
            break;
        case UCWMTASilver:
            return [UIColor colorWithHex:0xa7a9ac];
            break;
        case UCWMTAYellow:
            return [UIColor colorWithHex:0xffdd00];
            break;
        case UCWMTAPurple:
            return [UIColor colorWithHex:0x4c266f];
            break;
        default:
            return nil;
            break;
    }
}

- (NSString *)displayNameForLine:(UCTransitLineWMTA)line {
    switch (line) {
        case UCWMTAYellow:
            return @"YL";
            break;
        case UCWMTASilver:
            return @"SV";
            break;
        case UCWMTARed:
            return @"RD";
            break;
        case UCWMTAOrange:
            return @"OR";
            break;
        case UCWMTAGreen:
            return @"GR";
            break;
        case UCWMTABlue:
            return @"BL";
            break;
        case UCWMTAPurple:
            return @"PU";
            break;
        default:
            return nil;
            break;
    }
}

- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    UIColor *backColor = [self badgeColorForLine:self.line.lineCode];
    UIColor *foreColor = [self displayColorForLine:self.line.lineCode];

    CGFloat widthHeight = MIN(self.bounds.size.width, self.bounds.size.height);

    CGRect circle;
    circle.size.width = circle.size.height = widthHeight;
    circle.origin.x = self.bounds.size.width / 2.f - circle.size.width / 2.f;
    circle.origin.y = self.bounds.size.height / 2.f - circle.size.height / 2.f;
    CGContextSetFillColorWithColor(ctx, backColor.CGColor);
    CGContextFillEllipseInRect(ctx, circle);

    CGFloat heightPct = 0.65f;
    if (widthHeight <= 20.f) {
        heightPct = 0.8f;
    } else if (widthHeight <= 40.f) {
        heightPct = 0.7f;
    }
    CGFloat baseSize = 10.f;
    UIFont *testFont = [UIFont fontWithName:@"Helvetica-Bold" size:baseSize];
    CGFloat testHeight = [self.displayName sizeWithAttributes:@{ NSFontAttributeName: testFont }].height;

    CGFloat multiplier = (heightPct * widthHeight) / testHeight;
    UIFont *font = [UIFont fontWithName:@"Helvetica-Bold" size:multiplier * baseSize];
    CGSize textSize = [self.displayName sizeWithAttributes:@{ NSFontAttributeName: font }];
    CGPoint p = CGPointMake(self.bounds.size.width / 2.f - textSize.width / 2.f,
                            self.bounds.size.height / 2.f - textSize.height / 2.f);
    [self.displayName drawAtPoint:p withAttributes:@{ NSFontAttributeName: font,
                                                      NSForegroundColorAttributeName: foreColor}];
}

@end
