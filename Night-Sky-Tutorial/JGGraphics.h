
#import <UIKit/UIKit.h>

@interface JGGraphics : NSObject

+ (void)drawExtraLargeStarWithFrame: (CGRect)frame starColor: (UIColor*)starColor rotation: (CGFloat)rotation;
+ (void)drawLargeStarWithFrame: (CGRect)frame starColor: (UIColor*)starColor rotation: (CGFloat)rotation;
+ (void)drawMediumStarWithFrame: (CGRect)frame starColor: (UIColor*)starColor rotation: (CGFloat)rotation;
+ (void)drawExtraSmallStarWithFrame: (CGRect)frame starColor: (UIColor*)starColor rotation: (CGFloat)rotation;

+ (void)drawNightGradientWithCanvasSize: (CGSize)canvasSize;

@end
