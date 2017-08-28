//
//  BTChatModuleClick.m
//  My_SmartHome
//
//  Created by XM on 17/8/1.
//  Copyright © 2017年 my. All rights reserved.
//

#import "BTChatModuleClick.h"
#import "CMChatController.h"
#import "BTModuleManager.h"
@implementation BTChatModuleClick


-(void)onModuleClick{
    id<BTMainModuleInterface> mainModule = kBTModuleManager.mainModuleController;
    [mainModule setCurrentTabModule:[kBTModuleManager getModuleInfoByName:kModuleNameOfChat]];//设置单签标签选项卡

        CMChatController *mainController = (CMChatController *)[mainModule getTabControllerByName:kModuleNameOfChat];
        [mainModule showController:mainController];

}

@end
