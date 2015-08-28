
#import "JGStarView.h"
#import "JGGraphics.h"

@interface JGStarView ()

@property (nonatomic, strong) NSMutableArray *starFrames;

@end

@implementation JGStarView

- (void)drawRect:(CGRect)rect {
    
    if (self.starFrames != nil) {
        [self.starFrames removeAllObjects];
    }
    
    self.starFrames = [[NSMutableArray alloc] init];
    
    [self drawBigStars];
    [self drawLittleStars];
}


- (void) drawBigStars {
    CGFloat xAxis = 0;
    CGFloat yAxis = 25;
    CGFloat starFrameWidth = 22;
    
    CGFloat rotation = 0;
    CGFloat alpha = 1;

    NSUInteger rowCount = 0;
    
    for (int i = 1; i < 100; i++) {
        
        CGRect starFrame = CGRectMake(xAxis, yAxis, starFrameWidth, starFrameWidth);
        CGFloat maxX = CGRectGetMaxX(starFrame);
        
        UIColor *starColor = [[UIColor whiteColor] colorWithAlphaComponent:alpha];
        
        // 72° is one full star rotation.
        rotation = arc4random_uniform(72);
        
        // If the star will be off the screen, start a new row.
        if (maxX >= self.frame.size.width) {
            
            // Stagger starting x coordinate for even vs odd rows.
            if (rowCount % 2 == 0){
                xAxis = 30;
                
                // Only reduce alpha every other row.
                alpha *= .95;
                
            } else {
                xAxis = 5;
            }
            
            // Y axis move at least 30pts to prevent overlap + 10 random for staggering.
            yAxis += arc4random_uniform(10)+30;
            
            starFrame = CGRectMake(xAxis, yAxis, starFrameWidth, starFrameWidth);
            
            rowCount++;
            
            // If y moves past frame, reset y.
            if (yAxis > self.frame.size.height) {
                yAxis = 0;
                alpha = 1;
            }
        }
        
        // If star is not running off the screen, assign new X and Y coordinates.  X can move an extra 10pts.  Y is range bound +/- 10pts.
        else {
            starFrame = CGRectMake(xAxis+arc4random_uniform(10), yAxis+arc4random_uniform(20)-10, starFrameWidth, starFrameWidth);
            
            // Move x for next star.
            xAxis += arc4random_uniform(20)+60;
        }
        
        // If the new star's frame doesn't overlap another star then draw it.  Bigger stars are biased toward the top rows.  The modulo ensures that it only draws stars at certain iterations in the for loop to prevent drawing too many stars.
        if (![self starIntersects:starFrame]) {
            
            if (i % 2 == 0 && rowCount < 1) {
                [JGGraphics drawBiggerStarWithFrame:starFrame starColor:starColor rotation:rotation];
                
            } else if (rowCount < 4 && i % 2) {
                [JGGraphics drawBigStarWithFrame:starFrame starColor:starColor rotation:rotation];
                
            } else if (rowCount >= 1 && rowCount < 3 && i % 5) {
                [JGGraphics drawMediumStarWithFrame:starFrame starColor:starColor rotation:rotation];
                
            } else if (i % 3 == 0 && rowCount < 4 && i < 90) {
                [JGGraphics drawMediumStarWithFrame:starFrame starColor:starColor rotation:rotation];
                
            } else if (i % 5 == 0 && rowCount == 4) {
                
                [JGGraphics drawMediumStarWithFrame:starFrame starColor:starColor rotation:rotation];
            }
            
            // Add star frame to array to prevent overlapping stars.
            [self.starFrames addObject:[NSValue valueWithCGRect:starFrame]];
        }
    }
}

- (void) drawLittleStars {
    CGFloat xAxis = 0;
    CGFloat xAxisPadding = 10;
    CGFloat yAxis = -10;
    CGFloat starWidth = 2;
    
    CGFloat rotation = 0;
    CGFloat alpha = 1;
    
    for (int i = 1; i < 295; i++) {
        
        CGRect starFrame = CGRectMake(xAxis, yAxis, starWidth, starWidth);
        CGFloat maxX = CGRectGetMaxX(starFrame);
        
        UIColor *starColor = [[UIColor whiteColor] colorWithAlphaComponent:alpha];
        
        // 72° is one full star rotation.
        rotation = arc4random_uniform(72);
        
        // If the star + x padding will be off the screen, start a new row.
        if (maxX+xAxisPadding >= self.frame.size.width) {
            
            // Randomize starting coordinates
            xAxis = arc4random_uniform(15)+5;
            yAxis += arc4random_uniform(30);
            
            starFrame = CGRectMake(xAxis, yAxis, starWidth, starWidth);
            
            alpha *= .90;
            
            // If y moves past frame, reset y.
            if (yAxis > self.frame.size.height) {
                yAxis = 150;
                alpha *= .4;
            }
            
            // Increase speed of alpha reduction for bottom rows
            else if (yAxis > 200){
                alpha *=.9;
            }
            
            // If star is not running off the screen, assign new X and Y coordinates.  X and Y are range bound +20pts /-10pts.
        } else {
            starFrame = CGRectMake(xAxis+arc4random_uniform(30)-10, yAxis+arc4random_uniform(30)-10, starWidth, starWidth);
            
            // Move x for the next star.
            xAxis += 2 * starWidth + xAxisPadding * 2;
        }
        
        // Little stars can intersect, so no validation for CGRect.
        [JGGraphics drawLittleStarWithFrame:starFrame starColor:starColor rotation:rotation];
    }
}

- (BOOL) starIntersects:(CGRect)rect{
    
    for (NSValue *values in self.starFrames) {
        
        CGRect oldRect = values.CGRectValue;
        
        if (CGRectIntersectsRect(oldRect, rect)) {
            return YES;
        }
    }
    return NO;
}

@end
