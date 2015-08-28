
#import <UIKit/UIKit.h>

@interface JGGraphics : NSObject

+ (void)drawBiggerStarWithFrame: (CGRect)frame starColor: (UIColor*)starColor rotation: (CGFloat)rotation;
+ (void)drawBigStarWithFrame: (CGRect)frame starColor: (UIColor*)starColor rotation: (CGFloat)rotation;
+ (void)drawMediumStarWithFrame: (CGRect)frame starColor: (UIColor*)starColor rotation: (CGFloat)rotation;
+ (void)drawLittleStarWithFrame: (CGRect)frame starColor: (UIColor*)starColor rotation: (CGFloat)rotation;

+ (void)drawNightGradientWithCanvasSize: (CGSize)canvasSize;

@end
