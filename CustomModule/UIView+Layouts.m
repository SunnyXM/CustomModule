

#import "UIView+Layouts.h"
#import "UIFactory.h"
@implementation UIView (Layouts)
- (void)layoutBelow:(UIView *)target margin:(CGFloat)margin{
    [self setVY:target.getVBottom+margin];
}

- (void)layoutAlignLeft:(UIView *)target margin:(CGFloat)margin{
    [self setVX:target.getVLeft+margin];
}

-(void)layoutAlignBottom:(UIView *)target margin:(CGFloat)margin{
    [self setVY:target.getVBottom - self.getVHeight - margin];
}

- (void)layoutAlignTop:(UIView *)target margin:(CGFloat)margin{
    [self setVY:target.getVTop - self.getVHeight-margin];
}

- (void) layoutWrapSubView:(UIEdgeInsets)paddings{
//    CGRect subViewsRect = CGRectZero;
    CGFloat maxY = 0;
    CGFloat maxWidth = 0;
    CGFloat minY = 0;
    for (UIView *subview in self.subviews) {
        CGRect subFram = subview.frame;
         NSLog(@"subFram :x:%f,y:%f,width:%f,height:%f",CGRectGetMinX(subFram),CGRectGetMinY(subFram),CGRectGetWidth(subFram),CGRectGetHeight(subFram));
        CGFloat subWidth = subview.getVWidth;
        CGFloat subMinY = subview.getVTop;

        CGFloat subMaxY = subview.getVBottom;

        maxY = subMaxY> maxY? subMaxY:maxY;
        maxWidth = subWidth>maxWidth?subWidth:maxWidth;
        minY = subMinY< minY? subMinY:minY;
    }
    CGRect containerRect = CGRectMake(0, minY, maxWidth, maxY - minY);
     NSLog(@"containerRect :x:%f,y:%f,width:%f,height:%f",CGRectGetMinX(containerRect),CGRectGetMinY(containerRect),CGRectGetWidth(containerRect),CGRectGetHeight(containerRect));
    CGRect frameRect = UIEdgeInsetsInsetRect(containerRect, paddings);
    NSLog(@"frameRect :x:%f,y:%f,width:%f,height:%f",CGRectGetMinX(frameRect),CGRectGetMinY(frameRect),CGRectGetWidth(frameRect),CGRectGetHeight(frameRect));
    [self setVWidth:CGRectGetWidth(frameRect) height:CGRectGetHeight(frameRect)];
}
- (void)layouAlignRight:(UIView *)target margin:(CGFloat)margin{
    [self setVX:target.getVRight - self.getVWidth - margin];
}

- (void)layoutSubViewCenterVertical:(UIView *)subView{
    [UIFactory layoutview:subView centerVerticalInSuperView:self];
}
//
//- (void)layoutCircleToPoint:(CGPoint)center radius:(CGFloat)radius withAngle:(CGFloat)angle{
//    CGFloat newX = 0;
//    CGFloat newY = 0;
//    CGFloat caculateAngle =0;
//    angle = (NSInteger)angle%360;
//    if (angle>=0 &&angle <=90) {
//        caculateAngle = 90 - angle;
//        
//        newX = center.x+radius*cos( degreesToRadian(caculateAngle));
//        newY = center.y - radius*sin(degreesToRadian(caculateAngle) );
//      
//    }else if (angle>90 &&angle <=180){
//        caculateAngle = angle - 90;
//        newX = center.x+radius*cos( degreesToRadian(caculateAngle));
//        newY = center.y + radius*sin(degreesToRadian(caculateAngle) );
//        
//    }else if (angle > 180 && angle <= 270 ){
//        caculateAngle = angle -180;
//        newX = center.x - radius*sin(degreesToRadian(caculateAngle));
//        newY = center.y +radius*cos(degreesToRadian(caculateAngle));
//    }else if (angle>270 && angle <=360){
//        caculateAngle = angle - 270;
//        newX = center.x -radius*cos(degreesToRadian(caculateAngle));
//        newY = center.y - radius*sin(degreesToRadian(caculateAngle));
//    }
//      self.center = CGPointMake(newX, newY);
//}
@end
