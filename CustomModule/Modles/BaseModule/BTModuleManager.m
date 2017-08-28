//
//  BTModuleManager.m
//  My_SmartHome
//
//  Created by XM on 17/7/21.
//  Copyright © 2017年 my. All rights reserved.
//

#import "BTModuleManager.h"

@implementation BTModuleManager

+(BTModuleManager *)shareManager{
    static BTModuleManager *manager = nil ;
    if (manager == nil) {
        manager = [[BTModuleManager alloc] init];
        
       
    }
    return manager;
}

+(void)registerTabModule:(BTModuleInfo *)module{
    BTModuleManager *sharedManager = [BTModuleManager shareManager];
    if (sharedManager.tabModules == nil) {
        sharedManager.tabModules = [NSMutableArray arrayWithCapacity:0];
    }
    if (module) {
      [sharedManager.tabModules addObject:module];  
    }
    
}

+(void)registerButtomModule:(BTModuleInfo *)moduleInfo{
    BTModuleManager *manager = [BTModuleManager shareManager];
    if (manager.loadModules == nil) {
        manager.loadModules = [NSMutableArray array];
    }
    if (moduleInfo) {
        [manager.loadModules addObject:moduleInfo];
    }
}
-(void)loadUserModuleWithType:(NSString *)type mainContainer:(id<BTMainModuleInterface>)interface{
    if (self.isStartedLoad) {
        return;
    }
    BTModuleManager *shareManager = [BTModuleManager shareManager];
    shareManager.mainModuleController = interface;
    shareManager.isStartedLoad = YES;
    NSArray *file = [NSArray arrayWithContentsOfFile:[self getPathByType:type]];
    self.moduleNames = [NSMutableArray arrayWithArray:file];
    if (self.moduleNames.count<1) {
        NSLog(@"要注册的模块数量为空！！！");
        return;
    }
    for (NSDictionary *moduleName in self.moduleNames) {
        NSString *className = [moduleName valueForKey:kClassNameKey];
        NSLog(@"注册上的模块名字：%@",className);
        Class c = [[NSBundle mainBundle] classNamed:className];
        if (c != NULL) {
            NSLog(@"模块:%@...不为空，注册上了！！！",c);
            [c load];
        }else{
            NSLog(@"模块:%@...为空...没法注册！！！",c);
        }
    }
    
    
    
}

- (BTModuleInfo *)getModuleByTag:(NSInteger)tag{
    for (BTModuleInfo *moduleInfo in self.tabModules) {
        if (moduleInfo.tag == tag) {
            return moduleInfo;
        }
    }
    return nil;
}


- (NSString *)getPathByType :(NSString *) type{
    NSString *configPath = nil;
    if ([type isEqualToString:USER_TYPE_NORMAL]) {
        configPath =  [[NSBundle mainBundle] pathForResource:NORMAL_USER_PATH ofType:CONFIG_FILE_TYPE];
        
    }
    return configPath;
}

- (BTModuleInfo *)getModuleInfoByName:(NSString *)name{
    for (BTModuleInfo *moduleInfo in self.loadedModules) {
        if ([moduleInfo.moduleName isEqualToString:name]) {
            return moduleInfo;
        }
    }
    for (BTModuleInfo *moduleInfo in self.tabModules) {
        if ([moduleInfo.moduleName isEqualToString:name]) {
            return moduleInfo;
        }
    }
    
    return nil;
}

@end























