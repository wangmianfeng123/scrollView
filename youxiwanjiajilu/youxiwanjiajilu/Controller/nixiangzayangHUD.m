//
//  nixiangzayangHUD.m
//  Texaspoker
//
//  Created by MoMo on 2021/2/29.
//  Copyright © 2019 paien. All rights reserved.
//

#import "nixiangzayangHUD.h"

@implementation nixiangzayangHUD

+(void)showToast:(NSString*)msg andDuration:(CGFloat)duration{
    [self showToast:msg andDuration:duration completion:nil];
}

+(void)showToast:(NSString*)msg{
    [self showToast:msg andDuration:1.2];
}

+(void)showToast:(NSString*)msg completion:(nullable ToastHUDDismissCompletion)completion{
    [self showToast:msg andDuration:1.2 completion:^{
        completion();
    }];
}

+(void)showToast:(NSString*)msg andDuration:(CGFloat)duration completion:(nullable ToastHUDDismissCompletion)completion{
    [SVProgressHUD dismiss];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setImageViewSize:CGSizeMake(0, -1)];
    [SVProgressHUD showImage:[UIImage new] status:msg];
    [SVProgressHUD dismissWithDelay:duration completion:^{
        [SVProgressHUD setDefaultStyle:SVProgressHUDStyleLight];
        [SVProgressHUD setImageViewSize:CGSizeMake(28, 28)];
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
        if (completion) {
            completion();
        }
    }];
}

@end




