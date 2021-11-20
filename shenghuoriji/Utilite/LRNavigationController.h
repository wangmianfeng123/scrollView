//
//  LRNavigationController.h
//  Lofera
//
//  Created by 史建伟 on 14-9-20.
//  Copyright (c) 2014年 heyueqiang. All rights reserved.
//  重写了pushViewController 自定义返回图标 会造成返回手势失效的bug

#import <UIKit/UIKit.h>

#import "TianYaE_Macro.h"

@interface LRNavigationController : UINavigationController<UIGestureRecognizerDelegate,UINavigationControllerDelegate>
@property (nonatomic,strong)UIScreenEdgePanGestureRecognizer *screenEdgePanGestureRecognizer;
@property (nonatomic,strong)UIPercentDrivenInteractiveTransition *percentDrivenTransition;
//@property (nonatomic,strong)TTXPanInteractiveTransition *panInteractiveTransition;
@end
