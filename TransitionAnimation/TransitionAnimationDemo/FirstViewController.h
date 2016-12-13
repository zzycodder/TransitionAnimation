//
//  FirstViewController.h
//  TransitionAnimationDemo
//
//  Created by 张中阳 on 2016/12/13.
//  Copyright © 2016年 ZHANGZHONGYANG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController<UIViewControllerTransitioningDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIView *containView;

@end
