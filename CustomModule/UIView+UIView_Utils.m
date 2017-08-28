//
//  UIView+UIView_Utils.m
//  BaseUIKit
//
//  Created by 黄 帅 on 6/6/13.
//  Copyright (c) 2013 北京神州天鸿科技有限公司. All rights reserved.
//

#import "UIView+UIView_Utils.h"

@implementation UIView (UIView_Utils)
-(void) moveVByX:(CGFloat)x Y:(CGFloat)y{
    CGRect frame = self.frame;
    frame.origin.x += x;
    frame.origin.y += y;
    self.frame = frame;
}

- (void)setVHeight:(CGFloat)height{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (void)setVWidth:(CGFloat)width{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}


- (void)setVWidth:(CGFloat)width height:(CGFloat)height{
    CGRect frame = self.frame;
    frame.size.width = width;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)getVWidth{
    return CGRectGetWidth(self.frame);
}

- (CGFloat)getVHeight{
    return CGRectGetHeight(self.frame);
}

- (CGFloat)getVRight{
    return CGRectGetMaxX(self.frame);
}

- (CGFloat) getVLeft{
    return CGRectGetMinX(self.frame);
}

- (CGFloat) getVTop{
    return CGRectGetMinY(self.frame);
}

- (CGFloat)getVBottom{
    return CGRectGetMaxY(self.frame);
}
- (void)setVX:(CGFloat)x{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
    
}
- (void)setVY:(CGFloat)y{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
- (UIView *)getVSubViewByTag:(int)tg{
    
    for(UIView *view in self.subviews){
        if(view.tag == tg){
            return view;
        }
    }
    return nil;
}
-(UIImage *)getImageFromSelf
{
    //UIGraphicsBeginImageContext(theView.bounds.size);
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, YES, self.layer.contentsScale);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)removeAllSubviews{
    for (UIView *subView in self.subviews) {
        [subView removeFromSuperview];
    }
}
@end
