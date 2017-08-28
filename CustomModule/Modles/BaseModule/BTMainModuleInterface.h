//
//  BTMainModuleInterface.h
//  My_SmartHome
//
//  Created by XM on 17/8/1.
//  Copyright © 2017年 my. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BTModuleInfo.h"
@protocol BTMainModuleInterface <NSObject>

@property(nonatomic,strong)BTModuleInfo *currentTabModule;
@property(nonatomic,weak)UIViewController *currentTabController;

- (UIViewController *) getMainController;
- (UINavigationController *) getNavigationController;
/**
 *  展现一个tabController
 *
 *  @param controller 要展现的TabController
 */

- (void)showController:(UIViewController *)controller;
/**
 *  根据Tab名字获取Controller实例对象,如果在当前tabController字典里面有的话就会直接得到,没有的话就会
 *  生成一个出来并添加进子Controller和当前tabContainer视图然后再添加到tabController字典
 *
 *  @param name tab标签的名字
 *
 *  @return 对应的TabController
 */
- (UIViewController *)getTabControllerByName:(NSString *)name;

- (void)showSlideController;
- (UIViewController *)getSlideMenuController;
- (void)setSlideMenuController:(UIViewController *)controller;

- (void)showModalController:(UIViewController *)controller;

- (void)showNavigationModalController:(UIViewController *)controller;
@end
