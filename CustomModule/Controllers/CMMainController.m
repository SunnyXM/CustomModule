//
//  CMMainController.m
//  CustomModule
//
//  Created by XM on 17/8/28.
//  Copyright © 2017年 my. All rights reserved.
//

#import "CMMainController.h"
#import "BTModuleManager.h"
#import "BTHomeModuleClick.h"
@interface CMMainController ()

@end

@implementation CMMainController
@synthesize currentTabModule;
@synthesize currentTabController;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    [kBTModuleManager loadUserModuleWithType:USER_TYPE_NORMAL mainContainer:self];
    kBTModuleManager.mainModuleController = self;
    [self.tabModuleControllers removeAllObjects];
    self.tabModuleControllers  = [NSMutableDictionary dictionary];
    self.subContainer = [[UIView alloc] initWithFrame:CGRectMake(0, kStatueBarHeight, kDeviceWidth, KDeviceHeight-kStatueBarHeight-kTabHeight)];
    [self.view addSubview:self.subContainer];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self tabBar];
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
}



-(BUITabBar *)tabBar{
    if (_tabBar == nil) {
        _tabBar = [[BUITabBar alloc] initWithModuleInfos:kBTModuleManager.tabModules];
        [self.view addSubview:_tabBar];
        //选中默认模块
        BTModuleInfo *defaultModule = [kBTModuleManager getModuleByTag:kModuleTagOfHome];
        self.currentTabModule = defaultModule;
        [[defaultModule click] onModuleClick];
        [_tabBar selectModuleItem:defaultModule];
    }else{
        [_tabBar selectModuleItem:self.currentTabModule];
    }
    return _tabBar;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIViewController *)getTabControllerByName:(NSString *)name{
    
    UIViewController *moduleController = [self.tabModuleControllers objectForKey:name];
    if (moduleController == nil) {
        BTModuleInfo *moduleInfo = [kBTModuleManager getModuleInfoByName:name];
        if (!moduleInfo) {
            return nil ;
        }
        moduleController = [[[[NSBundle mainBundle] classNamed:moduleInfo.moduleClass] alloc] init];
        [self.tabModuleControllers setObject:moduleController forKey:name];
    }
    return moduleController;
}


-(void)showController:(UIViewController *)controller{
    if (controller == nil) {
        return;
    }
    if ([controller isEqual:self.currentTabController]) {
        return;
    }
    if (![self.childViewControllers containsObject:controller]) {
        [self.subContainer addSubview:controller.view];
        [self addChildViewController:controller];
        
        controller.view.alpha = 0;
        //[UIView animateWithDuration:0.3 animations:^{
            controller.view.alpha = 1;
       // }];
        self.currentTabController = controller;
    }else{
        controller.view.alpha = 0;
        //[UIView animateWithDuration:0.3 animations:^{
            controller.view.alpha = 1;
        //}];
    }
    
    NSLog(@"当前tab是：%@ 透明度是:%f",currentTabController,currentTabController.view.alpha);
    NSLog(@"controller是 :%@",controller);
//    [UIFactory cubeAView:self.subContainer duration:0.6f oritenTation:kCATransitionFromRight];
    if ([controller isEqual:currentTabController]) {
        controller.view.alpha = 1;
        return;
    }
    
    if (currentTabController != nil) {
        
        [self transitionFromViewController:currentTabController toViewController:controller duration:0 options:UIViewAnimationOptionTransitionCrossDissolve|UIViewAnimationOptionCurveLinear |UIViewAnimationOptionBeginFromCurrentState animations:^{
            currentTabController.view.alpha = 0;
            controller.view.alpha = 1;
            
            
        } completion:^(BOOL finished) {
            
        }];
        
    }
//    [UIFactory cubeAView:self.subContainer duration:0.6f oritenTation:kCATransitionFromRight];
    
    self.currentTabController = controller;
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
