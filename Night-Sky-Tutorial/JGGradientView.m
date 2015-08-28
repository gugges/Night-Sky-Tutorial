
#import "JGGradientView.h"
#import "JGGraphics.h"

@implementation JGGradientView

- (void)drawRect:(CGRect)rect {
    [JGGraphics drawNightGradientWithCanvasSize:CGSizeMake(self.frame.size.width, self.frame.size.height)];
}

@end
