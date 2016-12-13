//
//  PresentTransion.m
//  TransitionAnimationDemo
//
//  Created by 张中阳 on 2016/12/13.
//  Copyright © 2016年 ZHANGZHONGYANG. All rights reserved.
//

#import "PresentTransion.h"
#import "FirstViewController.h"
#import "SecondViewController.h"



/** 
 一 ：准备需要的对象
 1.FromViewController:  转场动画当前的View
 2.ToViewController：   转场动画要显示的View
 3.ContainerView：      做动画需要的容器View
 4.snapshotView：       真正做位移动画的View
 注：snapshotView的frame不应该直接用FromViewController的ImagView的frame,而要转化为在ContainerView中的frame
 
 二：把转场动画的前后两个View添加到containerView中（注意添加的顺序不能错，先添加控制器的View，再添加截图View）
   [containerView addSubview:secondVC.view];
   [containerView addSubview:snapImagView];
 
 三：做动画
 注：snapshotView的frame不应该直接用ToViewController的ImagView的frame,而要转化为在ContainerView中的frame
 最后移除snapshotView，同时告诉系统转场完毕:[transitionContext completeTransition:!transitionContext.transitionWasCancelled];
 
 */

@implementation PresentTransion
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.3;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UINavigationController *nav = (UINavigationController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    FirstViewController *firstVC = (FirstViewController *)nav.topViewController;
    SecondViewController *secondVC = (SecondViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    secondVC.view.frame = [transitionContext finalFrameForViewController:secondVC];
    UIView *containerView = transitionContext.containerView;
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    UIView *snapImagView = [firstVC.imageView snapshotViewAfterScreenUpdates:NO];
    snapImagView.frame = [containerView convertRect:firstVC.imageView.frame fromView:firstVC.containView];
    
    firstVC.imageView.hidden = YES;
    secondVC.view.alpha = 0;
    secondVC.imagView.hidden = YES;
    
    [containerView addSubview:secondVC.view];
    [containerView addSubview:snapImagView];
    
    [UIView animateWithDuration:duration animations:^{
        
        secondVC.view.alpha = 1.0;
        CGRect frame = [containerView convertRect:secondVC.imagView.frame fromView:secondVC.view];
        snapImagView.frame = frame;
        
        NSLog(@"secondVC.imgView.frame == %@", NSStringFromCGRect(frame));

    }completion:^(BOOL finished) {
        
        [snapImagView removeFromSuperview];
         secondVC.imagView.hidden = NO;
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
    
    
    
}








@end
