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



@implementation PresentTransion
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.35;
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
