//
//  AppDelegate.m
//  youxiwanjiajilu
//
//  Created by 王绵峰 on 2021/2/23.
//

#import "AppDelegate.h"
#import "tiankongzhichengViewController.h"
#import "gexinghuliViewController.h"

#import "BaseNavigationController.h"
#import "WRNavigationBar.h"
#import <IQKeyboardManager/IQKeyboardManager.h>

UIColor *MainNavBarColor = nil;
UIColor *MainViewColor = nil;


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [IQKeyboardManager sharedManager].enable = YES;
    
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    BaseNavigationController *firstNav = [[BaseNavigationController alloc] initWithRootViewController:[tiankongzhichengViewController new]];
    BaseNavigationController *secondNav = [[BaseNavigationController alloc] initWithRootViewController:[gexinghuliViewController new]];
    
    
    UITabBarController *tabBarVC = [[UITabBarController alloc]init];
    
    tabBarVC.viewControllers = @[firstNav, secondNav];
    
    [self setTabBarItems:tabBarVC];
    
    self.window.rootViewController = tabBarVC;
    
//    [self setNavBarAppearence];
    
    [self.window makeKeyAndVisible];
    
    
    
    [SVProgressHUD setFont:[UIFont systemFontOfSize:16]];
    
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    return YES;
}



- (void)setTabBarItems:(UITabBarController*)tabBarVC
{
    NSArray *titles = @[@"Home", @"Mine"];
    NSArray *normalImages = @[@"poker", @"mine"];
    NSArray *highlightImages = @[@"poker-select", @"mine-select"];
    [tabBarVC.tabBar.items enumerateObjectsUsingBlock:^(UITabBarItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.title = titles[idx];
        obj.image = [[UIImage imageNamed:normalImages[idx]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        obj.selectedImage = [[UIImage imageNamed:highlightImages[idx]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [obj setTitleTextAttributes:@{NSFontAttributeName : [UIFont fontWithName:@ "Arial Rounded MT Bold"  size:12.0f], NSForegroundColorAttributeName : [UIColor grayColor]} forState:UIControlStateNormal];
        
        [obj setTitleTextAttributes:@{NSFontAttributeName :  [UIFont fontWithName:@ "Arial Rounded MT Bold"  size:12.0f],NSForegroundColorAttributeName :kColorWithHex(0x1296db)} forState:UIControlStateSelected];
        
    }];
    
    
    [tabBarVC.tabBar setBarTintColor:kColorWithHex(0x000000)];
}

//- (void)setNavBarAppearence
//{
//
//
//    MainNavBarColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1];
//    MainViewColor   = [UIColor colorWithRed:126/255.0 green:126/255.0 blue:126/255.0 alpha:1];
//
//
//
//    [WRNavigationBar wr_widely];
//    [WRNavigationBar wr_setBlacklist:@[@"SpecialController",
//                                       @"TZPhotoPickerController",
//                                       @"TZGifPhotoPreviewController",
//                                       @"TZAlbumPickerController",
//                                       @"TZPhotoPreviewController",
//                                       @"TZVideoPlayerController"]];
//
//    [WRNavigationBar wr_setDefaultNavBarBarTintColor:MainNavBarColor];
//    [WRNavigationBar wr_setDefaultNavBarTintColor:[UIColor whiteColor]];
//    [WRNavigationBar wr_setDefaultNavBarTitleColor:[UIColor whiteColor]];
//    [WRNavigationBar wr_setDefaultStatusBarStyle:UIStatusBarStyleLightContent];
//    [WRNavigationBar wr_setDefaultNavBarShadowImageHidden:YES];
//}



@end
