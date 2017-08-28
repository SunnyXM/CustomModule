//
//  UIView+UIView_Utils.h
//  BaseUIKit
//
//  Created by 黄 帅 on 6/6/13.
//  Copyright (c) 2013 北京神州天鸿科技有限公司. All rights reserved.
//

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
