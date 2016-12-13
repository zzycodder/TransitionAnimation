//
//  FirstViewController.m
//  TransitionAnimationDemo
//
//  Created by 张中阳 on 2016/12/13.
//  Copyright © 2016年 ZHANGZHONGYANG. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "PresentTransion.h"
#import "DismissTransition.h"

@interface FirstViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.title = @"FirstVC";
    self.imageView.layer.masksToBounds = YES;
    self.imageView.layer.cornerRadius = 25;
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
}
#pragma mark - UIViewControllerTransitioningDelegate
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return [[PresentTransion alloc] init];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [[DismissTransition alloc] init];
}


#pragma mark - Action
- (IBAction)beginAnimation:(id)sender {
    
    SecondViewController *toVC = [[SecondViewController alloc] init];
    toVC.transitioningDelegate = self;
    [self presentViewController:toVC animated:YES completion:nil];
    
}






@end
