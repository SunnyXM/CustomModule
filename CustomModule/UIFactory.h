//
//  UIFactory.h
//  CustomModule
//
//  Created by XM on 17/8/28.
//  Copyright © 2017年 my. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface UIFactory : NSObject
+(id)loadViewFromNib:(NSString *)nib owner:(id)owner;
+(void)layoutView:(UIView *)view centerInSuperView:(UIView *)superView;
+(void)layoutView:(UIView *)view centerHorizontalInSuperView:(UIView *)superView;
+(void)setView:(UIView *)view1 behandView:(UIView *)view2 space:(CGFloat)space needAlignVertical:(BOOL)isNeeded;
+(void)layoutAlignLeft:(UIView *)view inSuperView:(UIView *)superView marginLeft:(float)margin;
+(void)cubeAView:(UIView *)view duration:(NSTimeInterval)d oritenTation:(NSString *)orientation;
+ (void)layoutview:(UIView *)view centerVerticalInSuperView:(UIView *)superView;
@end

