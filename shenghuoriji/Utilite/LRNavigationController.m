//
//  LRNavigationController.m
//  Lofera
//
//  Created by 史建伟 on 14-9-20.
//  Copyright (c) 2014年 heyueqiang. All rights reserved.
//

#import "LRNavigationController.h"
@interface LRNavigationController ()

@end

@implementation LRNavigationController
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self)
    {
    }
    return  self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];

    UIColor * color = [UIColor whiteColor];
    self.navigationBar.barStyle = UIBarStyleBlack;
    NSDictionary * dict=[NSDictionary dictionaryWithObject:color forKey:NSForegroundColorAttributeName];
    self.navigationBar.titleTextAttributes = dict;
    self.navigationBar.tintColor = color;
    __weak LRNavigationController *weakSelf = self;
    
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        self.interactivePopGestureRecognizer.delegate = weakSelf;
        self.delegate = weakSelf;
    }
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated

{
    [super pushViewController:viewController animated:animated];
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
//    if ([viewController isKindOfClass:[LRCommentViewController class]])
//    {
//        viewController.navigationItem.leftBarButtonItem =[self commentLeftBackButton];
//        viewController.navigationItem.leftBarButtonItem.tintColor = [UIColor redColor];
//    }
//    else
    if(viewController.navigationItem.leftBarButtonItem== nil && [self.viewControllers count] > 1)
    {
        viewController.navigationItem.leftBarButtonItem =[self customLeftBackButton];
    }
    
}
- (UIBarButtonItem*)customLeftBackButton{
    
    UIImage *image=[UIImage imageNamed:@"back"];
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.contentEdgeInsets =  UIEdgeInsetsMake(0, -6, 0, 34);
    btn.frame = CGRectMake(0,0 , 52,24 );
//    btn.frame=CGRectMake(0, 0, image.size.width, image.size.height);
    
    [btn setImage:image forState:UIControlStateNormal];
//    [btn setBackgroundImage:image forState:UIControlStateNormal];
//    if(self.backButtonDelegate)
//    {
//        [btn addTarget:self.backButtonDelegate action:@selector(didPopself) forControlEvents:UIControlEventTouchUpInside];
//    }
//    else
//    {
        [btn addTarget:self action:@selector(popself) forControlEvents:UIControlEventTouchUpInside];
//    }
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    return backItem;
}
- (UIBarButtonItem*)commentLeftBackButton{
    
    UIImage *image=[UIImage imageNamed:@"ttx_nav_cha"];
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.contentEdgeInsets =  UIEdgeInsetsMake(0, 5, 0, 0);
    btn.frame=CGRectMake(-10, 0, image.size.width + btn.contentEdgeInsets.right + btn.contentEdgeInsets.left, image.size.height + btn.contentEdgeInsets.bottom + btn.contentEdgeInsets.top);
    [btn setImage:image forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(popself) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    return backItem;
}
#pragma mark UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController
        didShowViewController:(UIViewController *)viewController
                     animated:(BOOL)animate
{
    // Enable the gesture again once the new controller is shown
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        if(viewController == self.viewControllers[0])
        {
            self.interactivePopGestureRecognizer.enabled = NO;
        }
        else
        {
            self.interactivePopGestureRecognizer.enabled = YES;
        }
//        else if(![viewController isMemberOfClass:[LRCommentViewController class]] && ![viewController isMemberOfClass:[LRMapViewController class]] && ![viewController isMemberOfClass:[TTXAddressListController class]]&& ![viewController isMemberOfClass:[TTXAddAddressController class]] && ![viewController isMemberOfClass:[LRLocationMapViewController class]])
//            self.interactivePopGestureRecognizer.enabled = YES;
    }
}
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
//    if(operation == UINavigationControllerOperationPop)
//    {
//        return self.popAnimation;
//    }
//    else if(operation == UINavigationControllerOperationPush)
//    {
//        [self.view removeGestureRecognizer:self.screenEdgePanGestureRecognizer];
//        UIScreenEdgePanGestureRecognizer *leftEdgeGesture = \
//        [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self
//                                                          action:@selector(panGestureAction:)];
//        leftEdgeGesture.edges = UIRectEdgeLeft;           // 屏幕左侧边缘响应
//        [self.view addGestureRecognizer:leftEdgeGesture]; // 给self.view添加上
//        self.popAnimation.toSnap = [self.tabBarController.view snapshotViewAfterScreenUpdates:NO];
////        self.percentDrivenTransition = [[UIPercentDrivenInteractiveTransition alloc]init];
//        
//        return nil;
//    }
//    else
    {
        return nil;
    }
}
- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController
{
//    return self.percentDrivenTransition ? self.percentDrivenTransition : nil;
    return  nil;
}
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
//- (UIViewController *)childViewControllerForStatusBarStyle{
//    return self.topViewController;
//}
- (UIScreenEdgePanGestureRecognizer *)screenEdgePanGestureRecognizer
{
    UIScreenEdgePanGestureRecognizer *screenEdgePanGestureRecognizer = nil;
    if (self.view.gestureRecognizers.count > 0)
    {
        for (UIGestureRecognizer *recognizer in self.view.gestureRecognizers)
        {
            if ([recognizer isKindOfClass:[UIScreenEdgePanGestureRecognizer class]])
            {
                screenEdgePanGestureRecognizer = (UIScreenEdgePanGestureRecognizer *)recognizer;
                break;
            }
        }
    }
    
    return screenEdgePanGestureRecognizer;
}

//- (UIViewController *)childViewControllerForStatusBarStyle{
//    return self.topViewController;
//}
//-(UIViewController *)popViewControllerAnimated:(BOOL)animated
//{
//    self.interactivePopGestureRecognizer.enabled = NO;
//    return    [super popViewControllerAnimated:animated];
//}
-(void)popself
{
    [self.view endEditing:YES];
    [self popViewControllerAnimated:YES];
}
-(void)panGestureAction:(UIPanGestureRecognizer *)gesture{
    CGPoint progress = [gesture translationInView:self.view];
    CGFloat percent = progress.x/ScreenWidth;
    NSLog(@"%lf",percent);
    if (gesture.state == UIGestureRecognizerStateBegan) {
        self.percentDrivenTransition = [[UIPercentDrivenInteractiveTransition alloc]init];
        [self popViewControllerAnimated:YES];
    }
    else if (gesture.state == UIGestureRecognizerStateChanged) {
        [self.percentDrivenTransition updateInteractiveTransition:percent];
    }
    else if (gesture.state == UIGestureRecognizerStateCancelled || gesture.state == UIGestureRecognizerStateEnded )
    {
        if( percent > 0.5) {
            [self.percentDrivenTransition finishInteractiveTransition];
            
        } else {

            [self.percentDrivenTransition cancelInteractiveTransition];
        }
        self.percentDrivenTransition = nil;
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
