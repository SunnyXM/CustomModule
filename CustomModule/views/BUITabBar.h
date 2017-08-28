//
//  BUITabBar.h
//  My_SmartHome
//
//  Created by XM on 17/8/1.
//  Copyright © 2017年 my. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BUIBarItem.h"
#import "BTModuleInfo.h"

#define KDeviceHeight [UIScreen mainScreen].bounds.size.height
#define kDeviceWidth [UIScreen mainScreen].bounds.size.width
#define kTabHeight 50
@interface BUITabBar : UIView


@property(nonatomic,strong) NSMutableArray *tabs;
@property(nonatomic,weak) UIView * rightestButton;
@property(nonatomic,assign) NSInteger tabCount;
@property(nonatomic,assign) CGFloat itemWidth;
@property(nonatomic,weak) BUIBarItem * currenItem;
@property(nonatomic,assign) CGFloat itemHeight;
@property(nonatomic,strong) NSMutableDictionary *tabDic;
@property(nonatomic,assign) BOOL isVertical;

/**
 *  从模块信息初始化一个TabBar 模块上TabBar的按钮
 *
 *  @param tabModuleInfos 模块信息
 *
 *  @return 从模块信息初始化的tabBar
 */
- (id)initWithModuleInfos:(NSMutableArray *)tabModuleInfos;

- (id)initWithModuleInfos:(NSMutableArray *)tabModuleInfos vertical:(BOOL)isVertical;

/**
 *  往TabBar上添加一个item 这个item 位于最右边
 *
 *  @param item 要添加的Item
 */
- (void)addBarItem:(BUIBarItem *)item;
/**
 *  选中某个模块
 *
 *  @param module 模块描述信息
 */
- (void)selectModuleItem:(BTModuleInfo *)module;
- (void)hideModuleItem:(BTModuleInfo *)modulerItem;
- (void)reloadTabModuleInfo:(NSMutableArray *)tabModeuInfo;
- (BUIBarItem *)getBarItemByName:(NSString *)name;
- (void)refreshMessageCount;

@end
