//
//  CMChatController.m
//  CustomModule
//
//  Created by XM on 17/8/28.
//  Copyright © 2017年 my. All rights reserved.
//

#import "CMChatController.h"
#import "BTModuleManager.h"
#import "BTChatModuleClick.h"
@interface CMChatController ()

@end

@implementation CMChatController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    // Do any additional setup after loading the view.
}

+(void)load{
    BTModuleManager *manager = [BTModuleManager shareManager];
    if (manager.isStartedLoad) {
        BTModuleInfo *info = [[BTModuleInfo alloc] initWithName:kModuleNameOfChat image:@"tab_icon_chat_inact" clickHandler:[[BTChatModuleClick alloc] init]  hilightedImg:@"tab_icon_chat_active" tag:kModuleTagOfChat moduleClass:@"CMChatController"];
        [BTModuleManager registerTabModule:info];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
