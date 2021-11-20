//
//  BDProgressHUD.m
//  YouXiaoErBD
//
//  Created by huan on 16/6/2.
//  Copyright © 2016年 cheng. All rights reserved.
//

#import "BDProgressHUD.h"
#import "AppDelegate.h"
@implementation BDProgressHUD
+ (MBProgressHUD *)showHudWithCustomImage:(UIImage *)image text:(NSString *)text
{

    MBProgressHUD *hud = [[MBProgressHUD alloc] init];
    [[AppDelegate appDelegate].window addSubview:hud];
    hud.removeFromSuperViewOnHide = YES;
    hud.customView = [[UIImageView alloc] initWithImage:image];
    hud.mode = MBProgressHUDModeCustomView;
    hud.labelText = text;
    return hud;
}
/*仅创建 不show window的subview*/
+ (MBProgressHUD *)showHudWithText:(NSString *)text view:(UIView*)view
{
    MBProgressHUD *hud = [[MBProgressHUD alloc] init];
    [view addSubview:hud];
    hud.removeFromSuperViewOnHide = NO;
    hud.mode = MBProgressHUDModeText;
    hud.labelText = text;
    hud.minSize = CGSizeMake(132.f, 108.0f);
    [hud show:YES];
    [hud hide:YES afterDelay:1];
    return hud;
}
+ (MBProgressHUD *)ShowIndicatorHudWithText:(NSString *)text view:(UIView *)view
{
    MBProgressHUD *hud = [[MBProgressHUD alloc] init];
    [view addSubview:hud];
    hud.labelText = text;
    [hud show:YES];
    hud.minSize = CGSizeMake(132.f, 108.0f);
    hud.removeFromSuperViewOnHide = NO;
    hud.animationType = MBProgressHUDAnimationZoom;

    return hud;
}
+ (MBProgressHUD *)ShowHudWithText1:(NSString *)text{
    MBProgressHUD *hud = [[MBProgressHUD alloc] init];
    [[AppDelegate appDelegate].window addSubview:hud];
    hud.animationType = MBProgressHUDAnimationFade;
    hud.detailsLabelText = text;
    hud.detailsLabelFont = [UIFont systemFontOfSize:15];
    hud.mode = MBProgressHUDModeText;
    hud.removeFromSuperViewOnHide = YES;
    [hud show:YES];
    [hud hide:YES afterDelay:3.0];
    return hud;
    
}
+ (MBProgressHUD *)ShowHudWithText:(NSString *)text{
    MBProgressHUD *hud = [[MBProgressHUD alloc] init];
    [[AppDelegate appDelegate].window addSubview:hud];
    hud.animationType = MBProgressHUDAnimationFade;
    hud.labelText = text;
    [hud show:YES];
    hud.mode = MBProgressHUDModeText;
    hud.yOffset = -100;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:2];
    return hud;
    
}

/*创建 并show window的subview*/
+ (MBProgressHUD *)ShowIndicatorHudWithText:(NSString *)text
{
    MBProgressHUD *hud = [[MBProgressHUD alloc] init];
    [[AppDelegate appDelegate].window addSubview:hud];
    hud.labelText = text;
    [hud show:YES];

    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:1];
    return hud;
}

@end
