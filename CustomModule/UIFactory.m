//
//  UIFactory.m
//  CustomModule
//
//  Created by XM on 17/8/28.
//  Copyright © 2017年 my. All rights reserved.
//

#import "UIFactory.h"

@implementation UIFactory

+(void)layoutView:(UIView *)view centerInSuperView:(UIView *)superView{
    CGRect viewFrame = view.frame;
    CGRect superFrame = superView.frame;
    CGFloat viewXPosition = (CGRectGetWidth(superFrame) - CGRectGetWidth(viewFrame)) * 0.5;
    CGFloat viewYPosition = (CGRectGetHeight(superFrame) - CGRectGetHeight(viewFrame))*0.5;
    viewFrame.origin.x = viewXPosition;
    viewFrame.origin.y = viewYPosition;
    view.frame = viewFrame;
}
+(void)layoutView:(UIView *)view centerHorizontalInSuperView:(UIView *)superView{
    CGRect viewFrame = view.frame;
    CGRect superFrame = superView.frame;
    CGFloat viewXPosition = (CGRectGetWidth(superFrame) - CGRectGetWidth(viewFrame)) * 0.5;
    viewFrame.origin.x = viewXPosition;
    view.frame = viewFrame;
}
+ (void)layoutview:(UIView *)view centerVerticalInSuperView:(UIView *)superView{
    CGRect viewFrame = view.frame;
    CGRect superFrame = superView.frame;
    CGFloat viewYPosition = (CGRectGetHeight(superFrame) - CGRectGetHeight(viewFrame))*0.5;
    viewFrame.origin.y = viewYPosition;
    view.frame = viewFrame;
}
+(id)loadViewFromNib:(NSString *)nib owner:(id)owner{
    
    return [[[NSBundle mainBundle] loadNibNamed:nib owner:owner options:nil] objectAtIndex:0];
}

+(void)setView:(UIView *)view1 behandView:(UIView *)view2 space:(CGFloat)space needAlignVertical:(BOOL)isNeeded{
    CGRect v1Frame = view1.frame;
    CGRect v2Frame = view2.frame;
    
    v1Frame.origin.x = v2Frame.origin.x+v2Frame.size.width+space;
    if (isNeeded) {
        v1Frame.origin.y = v2Frame.origin.y - ( v1Frame.size.height - v2Frame.size.height)*0.5;
    }
    
    view1.frame = v1Frame;
    
}
+(void)layoutAlignLeft:(UIView *)view inSuperView:(UIView *)superView marginLeft:(float)margin{
    CGRect viewBounds = view.bounds;
    //    CGRect superBounds = superView.bounds;
    float orignX = margin;
    CGRect viewFrame = CGRectMake(orignX, view.frame.origin.y, CGRectGetMaxX(viewBounds), CGRectGetMaxY(viewBounds));
    view.frame = viewFrame;
}

+(void)cubeAView:(UIView *)view duration:(NSTimeInterval)d oritenTation:(NSString *)orientation{
    [view.layer removeAllAnimations];
    CATransition *transition = [[CATransition alloc] init];
    transition.type = @"cube";
    transition.subtype = orientation;
    transition.duration = d;
    transition.removedOnCompletion = YES;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut] ;
    [view.layer addAnimation:transition forKey:@"ripple"];
}


@end
