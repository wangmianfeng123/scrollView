//
//  BDProgressHUD.h
//  YouXiaoErBD
//
//  Created by huan on 16/6/2.
//  Copyright © 2016年 cheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
@interface BDProgressHUD : NSObject
+ (MBProgressHUD *)showHudWithCustomImage:(UIImage *)image text:(NSString*)text;
+ (MBProgressHUD *)ShowIndicatorHudWithText:(NSString *)text view:(UIView *)view;
+ (MBProgressHUD *)ShowHudWithText:(NSString *)text;
+ (MBProgressHUD *)showHudWithText:(NSString *)text view:(UIView*)view;
+ (MBProgressHUD *)ShowHudWithText1:(NSString *)text;

@end
