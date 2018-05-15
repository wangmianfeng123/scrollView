//
//  FLTabBarController.m
//  TestLinkage
//
//  Created by Fingerfive on 2018/3/12.
//  Copyright © 2018年 qingtiantree. All rights reserved.
//

#import "FLTabBarController.h"
#import "FLHomerViewController.h"
#import "FLIMViewController.h"
#import "FLNavigationController.h"
#import "FLTabBar.h"
@interface FLTabBarController ()
@property(nonatomic ,strong) FLHomerViewController *homeVC;
@property(nonatomic ,strong) FLIMViewController *IMVC;
@end

@implementation FLTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self InitView];
    [self InitMiddleView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)InitMiddleView
{
    FLTabBar *tabBar = [[FLTabBar alloc] initWithButtonCount:3];
    [self setValue:tabBar forKey:@"tabBar"];
    [tabBar setDidMiddBtn:^{
        NSLog(@"点击了中间的加号");
    }];
}

- (void)InitView
{
    self.view.backgroundColor = [UIColor whiteColor];
    NSArray *titles = @[@"首页", @"聊天"];
    NSArray *images = @[@"tabbar_home", @"tabbar_message_center"];
    NSArray *selectedImages = @[@"tabbar_home_selected", @"tabbar_message_center_selected"];
    
    
    self.homeVC = [FLHomerViewController new];
    self.IMVC = [FLIMViewController new];
    
    
    NSArray *viewControllers = @[self.homeVC, self.IMVC];
    for (int i = 0; i < viewControllers.count; i++)
    {
        UIViewController *childVc = viewControllers[i];
        [self setVC:childVc title:titles[i] image:images[i] selectedImage:selectedImages[i]];
    }
}


- (void)setVC:(UIViewController *)VC title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    VC.tabBarItem.title = title;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor blackColor];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    [VC.tabBarItem setTitleTextAttributes:dict forState:UIControlStateNormal];
    VC.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    VC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    FLNavigationController *nav = [[FLNavigationController alloc] initWithRootViewController:VC];
    VC.title = title;
    [self addChildViewController:nav];
}
@end
