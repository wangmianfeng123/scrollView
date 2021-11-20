//
//  TianYaE_Macro.h
//  TianYa
//
//  Created by 程本德 on 2019/3/8.
//  Copyright © 2019 cbd. All rights reserved.
//

#ifndef TianYaE_Macro_h
#define TianYaE_Macro_h

#import "BQLDBTool.h"
#import "BQLDBModel.h"
#import "BQLElseTool.h"
#import "BDProgressHUD.h"
#import "AppDelegate.h"

#import "UIColor+Ex.h"
#import "UIViewAdditions.h"

#define SCREENWIDTH [[UIScreen mainScreen] bounds].size.width


#define nUserDefault [NSUserDefaults standardUserDefaults]

#define navBartintColor @"6179F6"
#define UXETintColor @"b6bbcc"//需要改
#define UXETintColorSel @"53cac3"//需要改6179F6
#define FontGray @"b6b6b6"//需要改6179F6
#define ViewBg @"f6f6f8"//需要改6179F6
#define MainColor @"feda00"//需要改6179F6
#define FontBlack @"161616"//需要改6179F6

#define UXECustomBarColor @"86CBBF"
 
//程序中默认字体
#define DEFAULT_FONT @"Helvetica"




//包括状态栏的屏幕尺寸
#define IS_iPhoneX (CGSizeEqualToSize(CGSizeMake(375.f, 812.f), [UIScreen mainScreen].bounds.size) || CGSizeEqualToSize(CGSizeMake(812.f, 375.f), [UIScreen mainScreen].bounds.size))
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
#define ScreenWidth   [UIScreen mainScreen].bounds.size.width
#define SafeAreaTopHeight (IS_iPhoneX ? 88 : 64)
#define SafeAreaBottomHeight (IS_iPhoneX ? 83 : 49)
#define kStatusBarHeight (IS_iPhoneX ? 44.f : 20.f)




#endif /* TianYaE_Macro_h */
