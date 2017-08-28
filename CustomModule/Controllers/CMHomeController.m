//
//  CMHomeController.m
//  CustomModule
//
//  Created by XM on 17/8/28.
//  Copyright © 2017年 my. All rights reserved.
//

#import "CMHomeController.h"
#import "BTModuleManager.h"
#import "BTHomeModuleClick.h"


@interface CMHomeController ()

@end

@implementation CMHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];

    // Do any additional setup after loading the view.
}
+(void)load{
    BTModuleManager *manager = [BTModuleManager shareManager];
    if (manager.isStartedLoad) {
        BTModuleInfo *info = [[BTModuleInfo alloc] initWithName:kModuleNameOfHome image:@"tab_icon_home_inact" clickHandler:[[BTHomeModuleClick alloc] init] hilightedImg:@"tab_icon_home_active" tag:kModuleTagOfHome moduleClass:@"CMHomeController"];
        [BTModuleManager registerTabModule:info];
    }
}
@end
