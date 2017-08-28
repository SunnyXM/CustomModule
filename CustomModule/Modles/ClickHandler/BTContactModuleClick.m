//
//  BTContactModuleClick.m
//  CustomModule
//
//  Created by XM on 17/8/28.
//  Copyright © 2017年 my. All rights reserved.
//

#import "BTContactModuleClick.h"
#import "BTModuleManager.h"
#import "BTMainModuleInterface.h"
#import "CMContactController.h"
@implementation BTContactModuleClick

-(void)onModuleClick{
    id<BTMainModuleInterface> mainModule = kBTModuleManager.mainModuleController;
    BTModuleInfo *mod =[kBTModuleManager getModuleInfoByName:kModuleNameOfContact];
    mainModule.currentTabModule = mod;//设置单签标签选项卡
    CMContactController *standFragment = (CMContactController *)[mainModule getTabControllerByName:kModuleNameOfContact];
    
    [mainModule showController:standFragment];
}

@end
