//
//  BTModuleManager.h
//  My_SmartHome
//
//  Created by XM on 17/7/21.
//  Copyright © 2017年 my. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BTModuleInfo.h"
#import "BTMainModuleInterface.h"
#define  USER_TYPE_NORMAL  @"UTN"
#define  NORMAL_USER_PATH  @"ModuleInfoNormalUser"
#define CONFIG_FILE_TYPE @"plist"
#define kBTModuleManager  [BTModuleManager shareManager]

#define kClassNameKey @"className"
#define kModuleNameOfHome @"主页"
#define kModuleNameOfContact @"联系人"
#define kModuleNameOfChat @"消息"

#define kModuleTagOfHome 1
#define kModuleTagOfContact 2
#define kModuleTagOfChat 3
@interface BTModuleManager : NSObject

@property(nonatomic,strong)NSMutableArray *loadModules;
@property(nonatomic,assign)BOOL isStartedLoad;
@property(nonatomic,weak)id<BTMainModuleInterface> mainModuleController;
@property(nonatomic,strong) NSMutableDictionary * moduleSchemeas;
@property(nonatomic,strong) NSMutableArray *moduleNames;
@property(nonatomic,strong) NSMutableArray *loadedModules;
@property(nonatomic,strong) NSMutableArray *tabModules;
+(BTModuleManager *)shareManager;
+(void)registerButtomModule:(BTModuleInfo *)moduleInfo;
-(void)loadUserModuleWithType:(NSString *)type mainContainer:(id<BTMainModuleInterface>)interface;
+(void)registerTabModule:(BTModuleInfo *)module;
- (BTModuleInfo *)getModuleByTag:(NSInteger)tag;
- (BTModuleInfo *)getModuleInfoByName:(NSString *)name;
@end
