
#import <UIKit/UIKit.h>

@interface UIView (UIView_Utils)
- (void) moveVByX:(CGFloat)x Y:(CGFloat)y;
- (void) setVHeight:(CGFloat) height;
- (void) setVWidth:(CGFloat) width;
- (void) setVWidth:(CGFloat)width height:(CGFloat) height;
- (CGFloat) getVHeight;
- (CGFloat) getVWidth;
- (CGFloat) getVBottom;
- (CGFloat) getVLeft;
- (CGFloat) getVRight;
- (CGFloat) getVTop;
- (void) setVX:(CGFloat) x;
- (void) setVY:(CGFloat) y;
- (UIView *)getVSubViewByTag:(int)tg;
- (UIImage *)getImageFromSelf;
- (void)removeAllSubviews;
@end
