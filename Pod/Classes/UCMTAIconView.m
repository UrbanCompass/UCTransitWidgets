//
//  UCMTAIconView.m
//  Pods
//
//  Created by Jerry Wong on 1/22/15.
//
//

#import "UCMTAIconView.h"

#import "UCTransitLine.h"
#import "UIColor+UCTransitColor.h"

@implementation UCMTAIconView

- (instancetype)initWithLine:(UCTransitLine *)line {
    self = [super initWithLine:line];
    if (self) {
        self.badge = [[UIView alloc] init];
        [self addSubview:self.badge];

        self.label = [[UILabel alloc] init];
        [self addSubview:self.label];

        self.badge.backgroundColor = [self badgeColorForLine:line.lineCode];
        self.label.textColor = [self displayColorForLine:line.lineCode];
        self.label.text = [self displayNameForLine:line.lineCode];
    }
    return self;
}

- (BOOL)isLineTriangleShaped:(UCTransitLineNY)line {
    if (line == UCMTALine6X || line == UCMTALine7X) {
        return YES;
    }
    return NO;
}

- (UIColor *)displayColorForLine:(UCTransitLineNY)line {
    switch (line) {
        case UCMTALine0:
        case UCMTALineS:
        case UCMTALineHH:
        case UCMTALine1:
        case UCMTALine2:
        case UCMTALine3:
        case UCMTALine4:
        case UCMTALine5:
        case UCMTALine6:
        case UCMTALine6X:
        case UCMTALine7:
        case UCMTALine7X:
        case UCMTALineA:
        case UCMTALineC:
        case UCMTALineE:
        case UCMTALineB:
        case UCMTALineD:
        case UCMTALineF:
        case UCMTALineM:
        case UCMTALineG:
        case UCMTALineJ:
        case UCMTALineZ:
        case UCMTALineL:
        case UCMTALineT:
            return [UIColor whiteColor];
            break;
        case UCMTALineN:
        case UCMTALineQ:
        case UCMTALineR:
            return [UIColor blackColor];
            break;
        default:
            return nil;
            break;
    }
}

- (UIColor *)badgeColorForLine:(UCTransitLineNY)line {
    switch (line) {
        case UCMTALine0:
        case UCMTALineS:
        case UCMTALineHH:
            return [UIColor colorWithHex:0x808183];
            break;
        case UCMTALine1:
        case UCMTALine2:
        case UCMTALine3:
            return [UIColor colorWithHex:0xee352e];
            break;
        case UCMTALine4:
        case UCMTALine5:
        case UCMTALine6:
        case UCMTALine6X:
            return [UIColor colorWithHex:0x00933c];
            break;
        case UCMTALine7:
        case UCMTALine7X:
            return [UIColor colorWithHex:0xb933ad];
            break;
        case UCMTALineA:
        case UCMTALineC:
        case UCMTALineE:
            return [UIColor colorWithHex:0x2850ad];
            break;
        case UCMTALineB:
        case UCMTALineD:
        case UCMTALineF:
        case UCMTALineM:
            return [UIColor colorWithHex:0xff6319];
            break;
        case UCMTALineG:
            return [UIColor colorWithHex:0x6cbe45];
            break;
        case UCMTALineJ:
        case UCMTALineZ:
            return [UIColor colorWithHex:0x996633];
            break;
        case UCMTALineL:
            return [UIColor colorWithHex:0xa7a9ac];
            break;
        case UCMTALineN:
        case UCMTALineQ:
        case UCMTALineR:
            return [UIColor colorWithHex:0xfccc0a];
            break;
        case UCMTALineT:
            return [UIColor colorWithHex:0x1d9dbf];
            break;
        default:
            return nil;
            break;
    }
}

- (NSString *)displayNameForLine:(UCTransitLineNY)line {
    switch (line) {
        case UCMTALine0:
        case UCMTALineS:
        case UCMTALineHH:
            return @"S";
            break;
        case UCMTALine1:
            return @"1";
            break;
        case UCMTALine2:
            return @"2";
            break;
        case UCMTALine3:
            return @"3";
            break;
        case UCMTALine4:
            return @"4";
            break;
        case UCMTALine5:
            return @"5";
            break;
        case UCMTALine6:
        case UCMTALine6X:
            return @"6";
            break;
        case UCMTALine7:
        case UCMTALine7X:
            return @"7";
            break;
        case UCMTALineA:
            return @"A";
            break;
        case UCMTALineB:
            return @"B";
            break;
        case UCMTALineC:
            return @"C";
            break;
        case UCMTALineD:
            return @"D";
            break;
        case UCMTALineE:
            return @"E";
            break;
        case UCMTALineF:
            return @"F";
            break;
        case UCMTALineG:
            return @"G";
            break;
        case UCMTALineJ:
            return @"J";
            break;
        case UCMTALineL:
            return @"L";
            break;
        case UCMTALineM:
            return @"M";
            break;
        case UCMTALineN:
            return @"N";
            break;
        case UCMTALineQ:
            return @"Q";
            break;
        case UCMTALineR:
            return @"R";
            break;
        case UCMTALineT:
            return @"T";
            break;
        case UCMTALineZ:
            return @"Z";
            break;
        default:
            return nil;
            break;
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];

    BOOL isTriangle = [self isLineTriangleShaped:self.line.lineCode];
    CGFloat widthHeight = 0.f;
    if (isTriangle) {
        CGFloat half = MIN(self.bounds.size.width, self.bounds.size.height) / 2.f;
        widthHeight = 2.f * half;
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(half, 0.f)];
        [path addLineToPoint:CGPointMake(2.f * half, half)];
        [path addLineToPoint:CGPointMake(half, 2.f * half)];
        [path addLineToPoint:CGPointMake(0.f, half)];
        [path closePath];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.path = path.CGPath;
        self.badge.layer.mask = maskLayer;
    } else {
        CGFloat cornerRadius = MIN(self.bounds.size.width, self.bounds.size.height) / 2.f;
        self.badge.layer.cornerRadius = cornerRadius;
        self.badge.layer.mask = nil;
        widthHeight = 2.f * cornerRadius;
    }

    CGRect r;
    r.size.width = r.size.height = widthHeight;
    r.origin.x = self.bounds.size.width / 2.f - r.size.width / 2.f;
    r.origin.y = self.bounds.size.height / 2.f - r.size.height / 2.f;
    self.badge.frame = r;

    CGFloat heightPct = 0.4f; // experimentally measured from the vignelli manual
    CGFloat baseSize = 10.f;
    UIFont *testFont = [UIFont fontWithName:@"Helvetica-Bold" size:baseSize];
    CGFloat capHeight = testFont.capHeight;

    CGFloat multiplier = (heightPct * widthHeight) / capHeight;
    UIFont *font = [UIFont fontWithName:@"Helvetica-Bold" size:multiplier * baseSize];
    self.label.font = font;
    [self.label sizeToFit];

    CGFloat centerY = font.ascender - font.capHeight / 2.f;
    r = self.label.frame;
    r.origin.x = self.bounds.size.width / 2.f - r.size.width / 2.f;
    r.origin.y = self.bounds.size.height / 2.f - r.size.height + centerY;
    self.label.frame = r;
}

@end

