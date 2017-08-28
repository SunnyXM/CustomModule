//
//  BUITabBar.m
//  My_SmartHome
//
//  Created by XM on 17/8/1.
//  Copyright © 2017年 my. All rights reserved.
//

#import "BUITabBar.h"
#import "UIView+Layouts.h"
@implementation BUITabBar

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

-(id)initWithModuleInfos:(NSMutableArray *)tabModuleInfos vertical:(BOOL)isVertical{
    if (self = [super init]) {
        self.isVertical  = isVertical;
        self.tabs = [NSMutableArray array];

        self.frame = CGRectMake(0, KDeviceHeight-kTabHeight, kDeviceWidth, kTabHeight);

        [self loadTabModuleInfo:tabModuleInfos];
        
    }
    return self;
}

- (id)initWithModuleInfos:(NSMutableArray *)tabModuleInfos{
    if (self = [super init]) {

        self.tabs = [NSMutableArray array];

        self.frame = CGRectMake(0, KDeviceHeight-kTabHeight, kDeviceWidth, kTabHeight);

        [self loadTabModuleInfo:tabModuleInfos];
        

        
    }
    
    return self;
}

-(void)loadTabModuleInfo:(NSMutableArray *)tabModeuInfo{
    self.tabCount = 0;
    if (self.tabDic == nil) {
        self.tabDic = [NSMutableDictionary dictionary];
    }
    [self.tabDic removeAllObjects];
    for (BTModuleInfo *info in tabModeuInfo) {
        if (info) {
            self.tabCount ++;
        }
    }
    self.itemWidth = self.getVWidth/self.tabCount;
    for (BTModuleInfo * moduleInfo in tabModeuInfo) {
        NSLog(@"tabbar加载的模块名字是：%@",moduleInfo.moduleName);
        if (moduleInfo) {
            BUIBarItem *item = [BUIBarItem itemWithModuleInfo:moduleInfo];
            [self.tabDic setObject:item forKey:moduleInfo.self.moduleClass];
            [self addBarItem:item];
        }
    }
}

- (void)addBarItem:(BUIBarItem *)item{
    if (self.tabs == nil) {
        self.tabs = [NSMutableArray array];
    }
    [item setVWidth:self.itemWidth];
    if (self.isVertical) {
        [item setVHeight:self.itemHeight];
        [item setVX:0];
    }
    [item setVY:0];
    [self.tabs addObject:item];

    [item.clickButton addTarget:self action:@selector(onTabButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    if (!self.rightestButton) {
        if (self.isVertical) {
            
            //            [UIFactory layoutAlignLeft:item inSuperView:self marginLeft:0];
            [item setVY:180];
        }else{
            [UIFactory layoutAlignLeft:item inSuperView:self marginLeft:0];
        }
    }else{
        if (self.isVertical) {
            [item layoutBelow:self.rightestButton margin:0];
        }else{
            [UIFactory setView:item behandView:self.rightestButton space:0 needAlignVertical:NO];
        }
    }
    self.rightestButton = item;
    //    NSLog(@"布局item是：%@",item);
    [self addSubview:item];
}

-(void)onTabButtonClicked:(UIButton *)button{
    BUIBarItem *item = (BUIBarItem *)button.superview;
    [item setSelected:YES];
    self.currenItem.selected = NO;
    item.selected = YES;
    self.currenItem = item;
}


-(void)reloadTabModuleInfo:(NSMutableArray *)tabModeuInfo{
    
}

- (void)selectModuleItem:(BTModuleInfo *)module{
    for (BUIBarItem * item in self.tabs) {
        if ([item.moduleInfo isEqual:module ]) {
            [self onTabButtonClicked:item.clickButton];
            self.currenItem = item;
            [item setSelected:YES];
        }
    }
}

-(BUIBarItem *)getBarItemByName:(NSString *)name{
    return [self.tabDic objectForKey:name];
}


- (void)refreshMessageCount{
    for (BUIBarItem *item in self.tabs) {
        [item fillModuleInfo:item.moduleInfo];
    }
}


@end












