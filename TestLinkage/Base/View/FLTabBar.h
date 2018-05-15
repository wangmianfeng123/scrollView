//
//  FLTabBar.h
//  TestLinkage
//
//  Created by Fingerfive on 2018/3/12.
//  Copyright © 2018年 qingtiantree. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FLTabBar : UITabBar
@property (nonatomic,copy) void(^didMiddBtn)();

- (instancetype) initWithButtonCount:(NSInteger) count;

@end
