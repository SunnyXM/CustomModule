//
//  BUIBarItem.h
//  My_SmartHome
//
//  Created by XM on 17/8/1.
//  Copyright © 2017年 my. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BTModuleInfo.h"
#import "UIFactory.h"
#define kBarItemColor [UIColor lightGrayColor]

@interface BUIBarItem : UIControl
@property (weak, nonatomic) IBOutlet UIButton *clickButton;
@property (weak, nonatomic) IBOutlet UIImageView *buttomImv;
@property (weak, nonatomic) IBOutlet UIImageView *tipImv;

@property(nonatomic,strong)BTModuleInfo *moduleInfo;
+(BUIBarItem *)itemWithModuleInfo:(BTModuleInfo *)moduleInfo;
- (void)fillModuleInfo:(BTModuleInfo *)m;
@end
