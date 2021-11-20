//
//  CommonHeader.h
//  ss--xx
//
//  Created by MoMo on 2019/4/22.
//  Copyright © 2019 zds. All rights reserved.
//

#ifndef CommonHeader_h
#define CommonHeader_h


#endif /* CommonHeader_h */
//主色系
#define navBar_color [UIColor colorWithRed:83.0f/255.f green:95.0f/255.f  blue:181.0f/255.f  alpha:1]

#define navBar_TintColor  [UIColor whiteColor]

#define navBar_title_color [UIColor whiteColor]







//屏幕宽高
#define kScreenWidth \
([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ? [UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale : [UIScreen mainScreen].bounds.size.width)
#define kScreenHeight \
([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ? [UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale : [UIScreen mainScreen].bounds.size.height)
#define kScreenSize \
([[UIScreen mainScreen] respondsToSelector:@selector(nativeBounds)] ? CGSizeMake([UIScreen mainScreen].nativeBounds.size.width/[UIScreen mainScreen].nativeScale,[UIScreen mainScreen].nativeBounds.size.height/[UIScreen mainScreen].nativeScale) : [UIScreen mainScreen].bounds.size)

#define kRGBColor(r, g, b)    [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1.0]
#define kRGBAColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:a]
#define kRandomColor    KRGBColor(arc4random_uniform(256)/255.0f,arc4random_uniform(256)/255.0f,arc4random_uniform(256)/255.0f)        //随机色生成
#define kColorWithHex(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 \
blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:1.0]







//数组是否为空
#define kISNullArray(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0 ||[array isEqual:[NSNull null]])

//是否是空对象


#import "QMUIKit.h"
#import "BaseViewController.h"
#import "MKCoreDataManager.h"
#import "tannaomenTableView.h"
#import "TimeDatemater.h"

#import "BaseNavigationController.h"
#import "NSDate+YYAdd.h"
#import "TimePickerView.h"

#import "UITableView+FDTemplateLayoutCell.h"
#import "UINavigationController+CATransition.h"
#import "MGSwipeTableCell.h"
#import <pop/POP.h>
#import "UIView+DCAnimationKit.h"
