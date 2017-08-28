//
//  BTModuleInfo.h
//  My_SmartHome
//
//  Created by XM on 17/7/21.
//  Copyright © 2017年 my. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BTModuleClick.h"
@interface BTModuleInfo : NSObject
@property(nonatomic,strong)BTModuleClick *click;
@property(nonatomic,copy)NSString *moduleName;
@property(nonatomic,copy)NSString *normalImg;
@property(nonatomic,copy)NSString *hilightedImg;
@property(nonatomic,assign)NSInteger tag;
@property(nonatomic,copy)NSString *moduleClass;
@property(nonatomic,copy) NSString *imagePath;
@property(nonatomic,assign) NSInteger messageCount;
- (id)initWithName:(NSString *)n image:(NSString *)img clickHandler:(BTModuleClick *)c hilightedImg:(NSString *)hImg tag:(NSInteger)t moduleClass:(NSString *)cName;
@end
