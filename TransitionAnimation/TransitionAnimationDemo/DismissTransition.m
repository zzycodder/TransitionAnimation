//
//  DismissTransition.m
//  TransitionAnimationDemo
//
//  Created by 张中阳 on 2016/12/13.
//  Copyright © 2016年 ZHANGZHONGYANG. All rights reserved.
//

#import "DismissTransition.h"
#import "FirstViewController.h"
#import "SecondViewController.h"

@implementation DismissTransition
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.35;
}
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UINavigationController *nav = (UINavigationController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    FirstViewController *toVC = (FirstViewController *)nav.topViewController;
    
    SecondViewController *fromVC = (SecondViewController *)[transitionContext  viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIView *contaninerView = [transitionContext containerView];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    UIView *cellImageSnapshot = [fromVC.imagView snapshotViewAfterScreenUpdates:YES];
    cellImageSnapshot.frame = [contaninerView convertRect:fromVC.imagView.frame fromView:fromVC.view];
    
    fromVC.imagView.hidden = YES;
    
    toVC.view.frame = [transitionContext finalFrameForViewController:toVC];
    toVC.view.alpha = 0;
    toVC.imageView.hidden = YES;
    
    [contaninerView addSubview:nav.view];
    [contaninerView addSubview:cellImageSnapshot];
    
    [UIView animateWithDuration:duration delay:0.0 usingSpringWithDamping:0.7 initialSpringVelocity:1 / 0.55 options:0 animations:^{
        toVC.view.alpha = 1.0;
        CGRect frame = [contaninerView convertRect:toVC.imageView.frame fromView:toVC.containView];
        cellImageSnapshot.frame = frame;
        
        
    } completion:^(BOOL finished) {
        
        toVC.imageView.hidden = NO;
        fromVC.imagView.hidden = NO;
        [cellImageSnapshot removeFromSuperview];
        
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
        
    }];
    

    
}

@end
