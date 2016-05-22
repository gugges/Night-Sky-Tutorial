
#import "JGGraphics.h"

@implementation JGGraphics

+ (void)drawNightGradientWithCanvasSize: (CGSize)canvasSize
{
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* blue = [UIColor colorWithRed: 0.153 green: 0.565 blue: 0.682 alpha: 1];
    UIColor* midnight = [UIColor colorWithRed: 0 green: 0 blue: 0.039 alpha: 1];
    
    //// Gradient Declarations
    CGFloat nIghtLocations[] = {0, 0.76};
    CGGradientRef night = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)@[(id)blue.CGColor, (id)midnight.CGColor], nIghtLocations);
    
    //// Rectangle Drawing
    CGRect rectangleRect = CGRectMake(0, 0, canvasSize.width, canvasSize.height);
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: rectangleRect];
    CGContextSaveGState(context);
    [rectanglePath addClip];
    CGContextDrawLinearGradient(context, night,
                                CGPointMake(CGRectGetMidX(rectangleRect), CGRectGetMaxY(rectangleRect)),
                                CGPointMake(CGRectGetMidX(rectangleRect), CGRectGetMinY(rectangleRect)),
                                0);
    CGContextRestoreGState(context);
    
    //// Cleanup
    CGGradientRelease(night);
    CGColorSpaceRelease(colorSpace);
}

+ (void)drawExtraLargeStarWithFrame: (CGRect)frame starColor: (UIColor*)starColor rotation: (CGFloat)rotation
{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// star Drawing
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, CGRectGetMinX(frame) + 11.12, CGRectGetMinY(frame) + 9.62);
    CGContextRotateCTM(context, -rotation * M_PI / 180);
    
    UIBezierPath* starPath = UIBezierPath.bezierPath;
    [starPath moveToPoint: CGPointMake(0, -9.38)];
    [starPath addLineToPoint: CGPointMake(2.5, -3.26)];
    [starPath addLineToPoint: CGPointMake(9.39, -2.9)];
    [starPath addLineToPoint: CGPointMake(4.04, 1.25)];
    [starPath addLineToPoint: CGPointMake(5.8, 7.58)];
    [starPath addLineToPoint: CGPointMake(0, 4.03)];
    [starPath addLineToPoint: CGPointMake(-5.8, 7.58)];
    [starPath addLineToPoint: CGPointMake(-4.04, 1.25)];
    [starPath addLineToPoint: CGPointMake(-9.39, -2.9)];
    [starPath addLineToPoint: CGPointMake(-2.5, -3.26)];
    [starPath closePath];
    [starColor setFill];
    [starPath fill];
    
    CGContextRestoreGState(context);
}

+ (void)drawLargeStarWithFrame: (CGRect)frame starColor: (UIColor*)starColor rotation: (CGFloat)rotation
{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// star Drawing
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, CGRectGetMinX(frame) + 9.62, CGRectGetMinY(frame) + 8.12);
    CGContextRotateCTM(context, -rotation * M_PI / 180);
    
    UIBezierPath* starPath = UIBezierPath.bezierPath;
    [starPath moveToPoint: CGPointMake(0, -7.88)];
    [starPath addLineToPoint: CGPointMake(2.12, -2.74)];
    [starPath addLineToPoint: CGPointMake(7.97, -2.43)];
    [starPath addLineToPoint: CGPointMake(3.42, 1.05)];
    [starPath addLineToPoint: CGPointMake(4.92, 6.37)];
    [starPath addLineToPoint: CGPointMake(0, 3.39)];
    [starPath addLineToPoint: CGPointMake(-4.92, 6.37)];
    [starPath addLineToPoint: CGPointMake(-3.42, 1.05)];
    [starPath addLineToPoint: CGPointMake(-7.97, -2.43)];
    [starPath addLineToPoint: CGPointMake(-2.12, -2.74)];
    [starPath closePath];
    [starColor setFill];
    [starPath fill];
    
    CGContextRestoreGState(context);
}

+ (void)drawMediumStarWithFrame: (CGRect)frame starColor: (UIColor*)starColor rotation: (CGFloat)rotation
{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// star Drawing
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, CGRectGetMinX(frame) + 6.96, CGRectGetMinY(frame) + 6.98);
    CGContextRotateCTM(context, -rotation * M_PI / 180);
    
    UIBezierPath* starPath = UIBezierPath.bezierPath;
    [starPath moveToPoint: CGPointMake(0, -7.03)];
    [starPath addLineToPoint: CGPointMake(1.2, -2.07)];
    [starPath addLineToPoint: CGPointMake(6.09, -3.51)];
    [starPath addLineToPoint: CGPointMake(2.39, -0)];
    [starPath addLineToPoint: CGPointMake(6.09, 3.51)];
    [starPath addLineToPoint: CGPointMake(1.2, 2.07)];
    [starPath addLineToPoint: CGPointMake(0, 7.03)];
    [starPath addLineToPoint: CGPointMake(-1.2, 2.07)];
    [starPath addLineToPoint: CGPointMake(-6.09, 3.51)];
    [starPath addLineToPoint: CGPointMake(-2.39, -0)];
    [starPath addLineToPoint: CGPointMake(-6.09, -3.51)];
    [starPath addLineToPoint: CGPointMake(-1.2, -2.07)];
    [starPath closePath];
    [starColor setFill];
    [starPath fill];
    
    CGContextRestoreGState(context);
}

+ (void)drawExtraSmallStarWithFrame: (CGRect)frame starColor: (UIColor*)starColor rotation: (CGFloat)rotation
{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// star Drawing
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, CGRectGetMinX(frame) + 2, CGRectGetMinY(frame) + 2);
    CGContextRotateCTM(context, -rotation * M_PI / 180);
    
    UIBezierPath* starPath = UIBezierPath.bezierPath;
    [starPath moveToPoint: CGPointMake(0, -1.5)];
    [starPath addLineToPoint: CGPointMake(0.18, -0.48)];
    [starPath addLineToPoint: CGPointMake(0.99, -1.15)];
    [starPath addLineToPoint: CGPointMake(0.45, -0.25)];
    [starPath addLineToPoint: CGPointMake(1.51, -0.26)];
    [starPath addLineToPoint: CGPointMake(0.51, 0.09)];
    [starPath addLineToPoint: CGPointMake(1.33, 0.75)];
    [starPath addLineToPoint: CGPointMake(0.34, 0.39)];
    [starPath addLineToPoint: CGPointMake(0.53, 1.41)];
    [starPath addLineToPoint: CGPointMake(0, 0.51)];
    [starPath addLineToPoint: CGPointMake(-0.53, 1.41)];
    [starPath addLineToPoint: CGPointMake(-0.34, 0.39)];
    [starPath addLineToPoint: CGPointMake(-1.33, 0.75)];
    [starPath addLineToPoint: CGPointMake(-0.51, 0.09)];
    [starPath addLineToPoint: CGPointMake(-1.51, -0.26)];
    [starPath addLineToPoint: CGPointMake(-0.45, -0.25)];
    [starPath addLineToPoint: CGPointMake(-0.99, -1.15)];
    [starPath addLineToPoint: CGPointMake(-0.18, -0.48)];
    [starPath closePath];
    [starColor setFill];
    [starPath fill];
    
    CGContextRestoreGState(context);
}

@end
