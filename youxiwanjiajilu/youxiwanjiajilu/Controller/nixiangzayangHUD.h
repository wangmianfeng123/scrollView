//
//  nixiangzayangHUD.h
//  Texaspoker
//
//  Created by MoMo on 2021/2/29.
//  Copyright © 2019 paien. All rights reserved.
//

#import <SVProgressHUD/SVProgressHUD.h>

typedef void (^ToastHUDDismissCompletion)(void);
@interface nixiangzayangHUD : SVProgressHUD
+(void)showToast:(NSString*_Nullable)msg;
+(void)showToast:(NSString*_Nullable)msg andDuration:(CGFloat)duration;
+(void)showToast:(NSString*_Nullable)msg completion:(nullable ToastHUDDismissCompletion)completion;
+(void)showToast:(NSString*_Nullable)msg andDuration:(CGFloat)duration completion:(nullable ToastHUDDismissCompletion)completion;
@end

