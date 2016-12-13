//
//  ListViewController.m
//  TransitionAnimationDemo
//
//  Created by 张中阳 on 2016/12/13.
//  Copyright © 2016年 ZHANGZHONGYANG. All rights reserved.
//

#import "ListViewController.h"
#import "DetailViewController.h"
#import "PushTransition.h"

@interface ListViewController ()<UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

static NSString *const cellIdentifier = @"cells";
@implementation ListViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.tableView registerNib:[UINib nibWithNibName:@"ClickCell" bundle:nil] forCellReuseIdentifier:cellIdentifier];
    
    self.navigationController.delegate = self;
}

#pragma mark - UITableView dataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 160;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ClickCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.firstLb.text = [NSString stringWithFormat:@"第%ld个", indexPath.row];
    
    return cell;
}

#pragma mark - UITableView delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ClickCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    self.clickCell = cell;
    self.imgV = cell.iconImg;
    
    DetailViewController *toVC = [[DetailViewController alloc] init];
    
    [self.navigationController pushViewController:toVC animated:YES];
}


#pragma mark  - <UINavigationControllerDelegate>

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC {
    // Push/Pop
    PushTransition *pushTransition = [[PushTransition alloc] init];
    
    if (operation == UINavigationControllerOperationPush) {
        return pushTransition;
    }else
    {
        return nil;
    }
}



@end
