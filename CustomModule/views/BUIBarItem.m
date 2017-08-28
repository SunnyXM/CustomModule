//
//  BUIBarItem.m
//  My_SmartHome
//
//  Created by XM on 17/8/1.
//  Copyright © 2017年 my. All rights reserved.
//

#import "BUIBarItem.h"
#import "UIView+Layouts.h"
@implementation BUIBarItem

- (void)fillModuleInfo:(BTModuleInfo *)m{
    self.moduleInfo = m ;

    self.buttomImv.highlightedImage = [UIImage imageNamed:self.moduleInfo.hilightedImg];
    self.buttomImv.image = [UIImage imageNamed:self.moduleInfo.normalImg];
    [self.clickButton addTarget:self.moduleInfo.click action:@selector(onModuleClick) forControlEvents:UIControlEventTouchUpInside];
    //    NSLog(@"click button:%@",clickButton);
    [self.clickButton setTitle:self.moduleInfo.moduleName forState:UIControlStateNormal];
    if (self.moduleInfo.messageCount>0) {
        self.tipImv.hidden = NO;
    }else{
        self.tipImv.hidden = YES;
    }
    [self.clickButton setBackgroundColor:kBarItemColor];
    
}
+(BUIBarItem *)itemWithModuleInfo:(BTModuleInfo *)moduleInfo{
    
    BUIBarItem *item =[UIFactory loadViewFromNib:@"BUIBarItem" owner:nil];
    [item fillModuleInfo:moduleInfo];
    return item;
}

- (void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    if (selected) {
        [self.clickButton setSelected:YES];
        [self.buttomImv setHighlighted:YES];
    }else{
        [self.clickButton setSelected:NO];
        [self.buttomImv setHighlighted:NO];
    }
}
- (void)layoutSubviews{
    [super layoutSubviews];
    [UIFactory layoutView:self.buttomImv centerHorizontalInSuperView:self];
    //    [UIFactory layoutView:tipImv centerHorizontalInSuperView:self];
    [self.tipImv layouAlignRight:self.buttomImv margin:-6];

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
