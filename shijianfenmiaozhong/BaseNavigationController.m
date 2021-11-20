//
//  BaseNavigationController.m
//  ss--dd
//
//  Created by MoMo on 2019/4/12.
//  Copyright © 2019 zds. All rights reserved.
//

#import "BaseNavigationController.h"


@interface BaseNavigationController ()

@end

@implementation BaseNavigationController


-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    [self setNeedsStatusBarAppearanceUpdate];
    
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

+ (void)initialize {
    // 设置导航items数据主题
    [self setupNavigationItemsTheme];
    
    // 设置导航栏主题
    [self setupNavigationBarTheme];
    
}


#pragma mark -  设置导航items数据主题
+ (void)setupNavigationItemsTheme {
    UIBarButtonItem *barButtonItem = [UIBarButtonItem appearance];
    // 设置字体颜色
    [barButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor], NSFontAttributeName : [UIFont systemFontOfSize:17]} forState:UIControlStateNormal];
    [barButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor lightGrayColor]} forState:UIControlStateHighlighted];
    [barButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor lightGrayColor]} forState:UIControlStateDisabled];
    
}

#pragma mark -  设置导航栏主题
+ (void)setupNavigationBarTheme {
    UINavigationBar * navBar = [UINavigationBar appearance];
    
    // 设置导航栏颜色
    [navBar setBarTintColor:navBar_color];
    //    // 设置导航栏title属性
    [navBar setTitleTextAttributes:@{NSForegroundColorAttributeName :navBar_title_color}];//标题字体颜色
    
    [navBar setTintColor:navBar_TintColor];//图片颜色
    
   // [navBar setBackgroundImage:[UIImage imageNamed:@"bgm"] forBarMetrics:UIBarMetricsDefault];//背景色
    
    
  //  [navBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];//背景色

    navBar.translucent =NO;
        
    [navBar setShadowImage:[UIImage new]];//黑
    
    
    
    
}


#pragma mark -  拦截所有push方法
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.viewControllers.count > 0) {
        // 如果navigationController的字控制器个数大于两个就隐藏
        viewController.hidesBottomBarWhenPushed = YES;
        
         viewController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@" " style:UIBarButtonItemStyleDone target:nil action:nil];
        
       
        //自定义返回按钮
        
//        if ([viewController isKindOfClass:[ViewController class]]) {
//            //自定义 修改navbar ，statusBar
//
//        }
        
    }
    [super pushViewController:viewController animated:YES];
}

//#pragma mark -  拦截所有pop方法
//- (void)back {
//    [super popViewControllerAnimated:YES];
//    //这里就可以自行修改返回按钮的各种属性等
//}


@end
