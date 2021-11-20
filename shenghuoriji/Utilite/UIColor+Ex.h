//
//  UIColor+Ex.h
//  HMContact
//
//  Created by hyq he on 12-4-27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
#import <UIKit/UIKit.h>
@interface UIColor (Ex)

+ (UIColor *)colorWithHexString:(NSString *)hex;
+ (UIColor *)colorWithHexString:(NSString *)hex alpha:(CGFloat)alpha;
+ (UIColor *)randomColor:(NSArray *)colorArray;

@end
