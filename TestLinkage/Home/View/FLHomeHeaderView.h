//
//  FLHomeHeaderView.h
//  TestLinkage
//
//  Created by Fingerfive on 2018/3/12.
//  Copyright © 2018年 qingtiantree. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FLHomeHeaderView : UIScrollView <UIScrollViewDelegate>



- (void) addButtons:(NSArray *) titleArray
            buttonW:(CGFloat)w;
// 联动
@property (nonatomic ,copy) void (^linkageAction)(NSInteger page);

// 选择页面
@property (nonatomic ,assign) NSInteger page;

@end
