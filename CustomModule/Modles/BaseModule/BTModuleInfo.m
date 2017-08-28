//
//  BTModuleInfo.m
//  My_SmartHome
//
//  Created by XM on 17/7/21.
//  Copyright © 2017年 my. All rights reserved.
//

#import "BTModuleInfo.h"

@implementation BTModuleInfo

-(id)initWithName:(NSString *)n image:(NSString *)img clickHandler:(BTModuleClick *)c hilightedImg:(NSString *)hImg tag:(NSInteger)t moduleClass:(NSString *)cName{
    if (self = [super init]) {
        self.moduleName  = n ;
        self.normalImg = img ;
        self.click = c ;
        self.hilightedImg = hImg;
        self.tag = t ;
        self.moduleClass = cName;
    }
    return self ;
}

@end
