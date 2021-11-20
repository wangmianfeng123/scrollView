//
//  zhuandaqianTianYaTabBarViewController.m
//  TianYa
//
//  Created by 程本德 on 2019/3/8.
//  Copyright © 2019 cbd. All rights reserved.
//

#import "zhuandaqianTianYaTabBarViewController.h"
#import "TianYaE_Macro.h"
#import "zhuandaqianTianYaMain1ViewController.h"
#import "zhuandaqianTianYaMain3ViewController.h"
#import "LRNavigationController.h"

@interface zhuandaqianTianYaTabBarViewController ()

@end

@implementation zhuandaqianTianYaTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
    


- (id)init
    {
        self = [super init];
        if (self) {
            UIViewController *TianYaMain1 = [self main1ControlleWithTabTitle:@"CMBill"
                                                                       image:[UIImage imageNamed:@"tab1_nor"]
                                                               selectedImage:[UIImage imageNamed:@"tab1_sel"]];
            
            UIViewController *TianYaMain3 = [self main3ControllerWithTabTitle:@"addBill"
                                                                          image:[UIImage imageNamed:@"tab3_nor"]
                                                                  selectedImage:[UIImage imageNamed:@"tab3_sel"]];
            
            self.viewControllers = @[TianYaMain1,TianYaMain3];
            self.tabBar.tintColor = [UIColor colorWithHexString:navBartintColor];
            
        }
        return self;
    }
    
- (UIViewController*)main1ControlleWithTabTitle:(NSString*)title image:(UIImage*)image selectedImage:(UIImage*)selectedImage
    {
        zhuandaqianTianYaMain1ViewController *v = [[zhuandaqianTianYaMain1ViewController alloc]init];
        LRNavigationController* viewController = [[LRNavigationController alloc] initWithRootViewController:v];
        [viewController.navigationBar setBarTintColor: [UIColor colorWithHexString:navBartintColor]];
        
        
        viewController.tabBarItem = [[UITabBarItem alloc]initWithTitle:title image:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [viewController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:UXETintColor]} forState:UIControlStateNormal];
        [viewController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:UXETintColorSel]}  forState:UIControlStateSelected];
        
        return viewController;
    }

- (UIViewController*)main3ControllerWithTabTitle:(NSString*)title image:(UIImage*)image selectedImage:(UIImage*)selectedImage
    {
        zhuandaqianTianYaMain3ViewController *v = [[zhuandaqianTianYaMain3ViewController alloc]init];
        LRNavigationController* viewController = [[LRNavigationController alloc] initWithRootViewController:v];
        [viewController.navigationBar setBarTintColor: [UIColor colorWithHexString:navBartintColor]];
        
        viewController.tabBarItem = [[UITabBarItem alloc]initWithTitle:title image:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [viewController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:UXETintColor]} forState:UIControlStateNormal];
        [viewController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:UXETintColorSel]}  forState:UIControlStateSelected];
        
        return viewController;
    }
    



@end
