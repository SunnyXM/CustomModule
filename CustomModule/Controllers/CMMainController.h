//
//  CMMainController.h
//  CustomModule
//
//  Created by XM on 17/8/28.
//  Copyright © 2017年 my. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BTMainModuleInterface.h"
#import "BUITabBar.h"
#import "UIFactory.h"

#define kStatueBarHeight MIN([UIApplication sharedApplication].statusBarFrame.size.height, [UIApplication sharedApplication].statusBarFrame.size.width)
@interface CMMainController : UIViewController<BTMainModuleInterface>
@property(nonatomic,strong)BUITabBar *tabBar;
@property(nonatomic,strong)NSMutableDictionary *tabModuleControllers;
@property(nonatomic,strong)UIView *subContainer;

@end
