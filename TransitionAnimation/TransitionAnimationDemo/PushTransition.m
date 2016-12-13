//
//  PushTransition.m
//  QQMusicTransformVC
//
//  Created by 张中阳 on 2016/12/5.
//  Copyright © 2016年 ZZY. All rights reserved.
//

#import "PushTransition.h"
#import "ListViewController.h"
#import "DetailViewController.h"
#import "ClickCell.h"


#define ANIMATION_DURATION 0.3


@interface PushTransition ()

@end

@implementation PushTransition

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return ANIMATION_DURATION;
}
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    ListViewController * fromVC = (ListViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    DetailViewController *toVC = (DetailViewController *)[transitionContext  viewControllerForKey:UITransitionContextToViewControllerKey];;
    toVC.textLb.text = fromVC.clickCell.firstLb.text;
    
    UIView *contaninerView = [transitionContext containerView];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    UIView *cellImageSnapshot = [fromVC.imgV snapshotViewAfterScreenUpdates:NO];
    cellImageSnapshot.frame = [contaninerView convertRect:fromVC.imgV.frame fromView:fromVC.clickCell.contentView];
//    cellImageSnapshot.backgroundColor = [UIColor redColor];
    
    fromVC.imgV.hidden = YES;
    toVC.view.frame = [transitionContext finalFrameForViewController:toVC];
    toVC.view.alpha = 0;
    toVC.imgV.hidden = YES;
    
    [contaninerView addSubview:toVC.view];
    [contaninerView addSubview:cellImageSnapshot];
    
    
    [UIView animateWithDuration:duration animations:^{
        
        toVC.view.alpha = 1.0;
        CGRect frame = [contaninerView convertRect:toVC.imgV.frame fromView:toVC.view];
        
        cellImageSnapshot.frame = frame;
        
        
    } completion:^(BOOL finished) {
        
        
        toVC.imgV.hidden = NO;
        fromVC.imgV.hidden = NO;
        [cellImageSnapshot removeFromSuperview];
        
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
        
//        if ([transitionContext transitionWasCancelled]) {
//            //失败后，我们要把vc1显示出来
//            fromVC.view.hidden = NO;
//            //然后移除截图视图，因为下次触发present会重新截图
//            [cellImageSnapshot removeFromSuperview];
//        }
    }];
    
    
}

@end
