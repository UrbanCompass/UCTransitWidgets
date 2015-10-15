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

@interface UCMTAIconView ()
@property (nonatomic) NSString *displayName;
@end

@implementation UCMTAIconView

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

- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    UIColor *backColor = [self badgeColorForLine:self.line.lineCode];
    UIColor *foreColor = [self displayColorForLine:self.line.lineCode];

    CGFloat widthHeight = MIN(self.bounds.size.width, self.bounds.size.height);
    CGFloat minX = self.bounds.size.width / 2.f - widthHeight / 2.f;
    CGFloat minY = self.bounds.size.height / 2.f - widthHeight / 2.f;
    if ([self isLineTriangleShaped:self.line.lineCode]) {
        CGFloat half = widthHeight / 2.f;
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(minX + half, minY)];
        [path addLineToPoint:CGPointMake(minX + widthHeight, minY + half)];
        [path addLineToPoint:CGPointMake(minX + half, minY + widthHeight)];
        [path addLineToPoint:CGPointMake(minX, minY + half)];
        [path closePath];
        CGContextSetFillColorWithColor(ctx, backColor.CGColor);
        CGContextAddPath(ctx, path.CGPath);
        CGContextFillPath(ctx);
    } else {
        CGRect circle;
        circle.size.width = circle.size.height = widthHeight;
        circle.origin.x = self.bounds.size.width / 2.f - circle.size.width / 2.f;
        circle.origin.y = self.bounds.size.height / 2.f - circle.size.height / 2.f;
        CGContextSetFillColorWithColor(ctx, backColor.CGColor);
        CGContextFillEllipseInRect(ctx, circle);
    }

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

