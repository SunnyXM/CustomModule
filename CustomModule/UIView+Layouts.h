

#import <UIKit/UIKit.h>
//#import "UIView+Layouts.h"
#import "UIView+UIView_Utils.h"
@interface UIView (Layouts)
- (void)layoutBelow:(UIView *)target margin:(CGFloat)margin;
- (void)layoutAlignLeft:(UIView *)target margin:(CGFloat)margin;
- (void)layoutAlignBottom:(UIView *)target margin:(CGFloat) margin;
- (void)layoutAlignTop:(UIView *)target margin:(CGFloat) margin;
- (void)layoutWrapSubView:(UIEdgeInsets)paddings;
- (void)layouAlignRight:(UIView *)target margin:(CGFloat) margin;
- (void)layoutSubViewCenterVertical:(UIView *)subView;
- (void)layoutCircleToPoint:(CGPoint) center radius:(CGFloat)radius withAngle:(CGFloat)angle;
@end
