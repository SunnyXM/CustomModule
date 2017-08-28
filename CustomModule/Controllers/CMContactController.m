//
//  CMContactController.m
//  CustomModule
//
//  Created by XM on 17/8/28.
//  Copyright © 2017年 my. All rights reserved.
//

#import "CMContactController.h"
#import "BTModuleManager.h"
#import "BTContactModuleClick.h"
@interface CMContactController ()

@end

@implementation CMContactController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor  = [UIColor grayColor];
    // Do any additional setup after loading the view.
}

+(void)load{
    BTModuleManager *manager = [BTModuleManager shareManager];
    if (manager.isStartedLoad) {
        BTModuleInfo *info = [[BTModuleInfo alloc] initWithName:kModuleNameOfContact image:@"tab_icon_chat_inact" clickHandler:[[BTContactModuleClick alloc] init]  hilightedImg:@"tab_icon_chat_active" tag:kModuleTagOfContact moduleClass:@"CMContactController"];
        [BTModuleManager registerTabModule:info];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
