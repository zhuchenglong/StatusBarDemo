//
//  ViewController.m
//  StatusBarDemo
//
//  Created by zhuchenglong on 16/7/1.
//  Copyright © 2016年 zhuchenglong. All rights reserved.
//

#import "ViewController.h"
#import "AViewController.h"
@interface ViewController ()

@end
//如果是带导航条的情况，需要每一页不同的状态栏颜色需要View controller-based status bar appearance 设置成NO
@implementation ViewController

//设置字体颜色
//- (UIStatusBarStyle)preferredStatusBarStyle{
//    return UIStatusBarStyleLightContent;//白色
//}

//设置状态栏背景颜色
- (void)setStatusBarBackgroundColor:(UIColor *)color {
    
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}
-(void)viewWillAppear:(BOOL)animated{
   // [self preferredStatusBarStyle];
    [self setStatusBarBackgroundColor:[UIColor redColor]];
     [UIApplication sharedApplication].statusBarStyle=UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我是导航条";
    [self.navigationController.navigationBar setBarTintColor:[UIColor magentaColor]];
    self.view.backgroundColor = [UIColor yellowColor];
   
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"下一页" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
    button.frame = CGRectMake(100, 100, 80, 35);
    [self.view addSubview:button];
    [button addTarget:self action:@selector(nextPage) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)nextPage{

    AViewController *avc = [AViewController new];
    [self.navigationController pushViewController:avc animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
