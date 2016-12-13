//
//  SecondViewController.m
//  TransitionAnimationDemo
//
//  Created by 张中阳 on 2016/12/13.
//  Copyright © 2016年 ZHANGZHONGYANG. All rights reserved.
//

#import "SecondViewController.h"

#define kImageWidth   240 / 375
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    self.imagView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.png"]];
    self.imagView.frame = CGRectMake(0, 0, kScreenWidth *kImageWidth, kScreenWidth *kImageWidth);
    self.imagView.center = self.view.center;
    self.imagView.layer.cornerRadius = kScreenWidth *kImageWidth / 2;
    self.imagView.layer.masksToBounds = YES;
    self.imagView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:_imagView];
//    NSLog(@"self.imagView.frame == %@", NSStringFromCGRect(self.imagView.frame));
//    NSLog(@"self.view.frame == %@", NSStringFromCGRect(self.view.frame));
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"dimiss" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor redColor];
    btn.titleLabel.font = [UIFont systemFontOfSize:16];
    btn.frame = CGRectMake(self.view.center.x - 60, self.view.bounds.size.height - 120, 100, 40);
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(dismissFirst:) forControlEvents:UIControlEventTouchUpInside];
    
    
}

- (void)dismissFirst:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
