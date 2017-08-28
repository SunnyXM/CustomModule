//
//  BTHomeModuleClick.m
//  My_SmartHome
//
//  Created by XM on 17/8/1.
//  Copyright © 2017年 my. All rights reserved.
//

#import "BTHomeModuleClick.h"
#import "CMHomeController.h"
#import "BTModuleManager.h"
@implementation BTHomeModuleClick
-(void)onModuleClick{
    id<BTMainModuleInterface> mainModule = kBTModuleManager.mainModuleController;
    BTModuleInfo *mod =[kBTModuleManager getModuleInfoByName:kModuleNameOfHome];
    mainModule.currentTabModule = mod;//设置单签标签选项卡
    CMHomeController *standFragment = (CMHomeController *)[mainModule getTabControllerByName:kModuleNameOfHome];

    [mainModule showController:standFragment];
}
@end
