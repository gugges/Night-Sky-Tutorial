
#import "JGNightGradientView.h"
#import "JGGraphics.h"

@implementation JGNightGradientView

- (void)drawRect:(CGRect)rect
{
    [JGGraphics drawNightGradientWithCanvasSize:CGSizeMake(self.frame.size.width, self.frame.size.height)];
}

@end
