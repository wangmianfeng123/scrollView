//
//  AppDelegate.m
//  shenghuoriji
//
//  Created by 王绵峰 on 2020/12/29.
//

#import "AppDelegate.h"
#import "TianYaE_Macro.h"
#import "zhuandaqianTianYaTabBarViewController.h"
#import "zhuandaqianTianYaClassificationManagementModel.h"
#import "BQLDBTool.h"
#import "zhuandaqianTianYaBillModel.h"

@interface AppDelegate (){
    BQLDBTool *tool;
    NSDictionary *billListData;
}

@end

@implementation AppDelegate

+ (AppDelegate *)appDelegate;{
    
        return (AppDelegate *)[UIApplication sharedApplication].delegate;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    tool = [BQLDBTool instantiateTool];

    billListData = @{
                     @"bill_type":@"",
                     @"bill_name":@"",
                     @"bill_money":@"",
                     @"bill_date":@"",
                     @"bill_note":@"",
                     @"bill_image":@""
                     };

    zhuandaqianTianYaBillModel *model = [zhuandaqianTianYaBillModel modelWithDictionary:billListData];

    [tool openDBWith:BillListFile Model:model];
    zhuandaqianTianYaTabBarViewController *tabbar = [[zhuandaqianTianYaTabBarViewController alloc]init];
    self.window.rootViewController = tabbar;
    [self.window makeKeyAndVisible];
    
    return YES;
}





@end
