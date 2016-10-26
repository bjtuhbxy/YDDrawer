
//
//  HomeViewController.m
//  YDDrawer
//
//  Created by apple on 16/6/19.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "HomeViewController.h"
#import "SetViewController.h"

#define OriginX 200
@interface HomeViewController ()

{
    UIView *_leftView;
    float navOriginX;
}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [[UIApplication sharedApplication].delegate window].backgroundColor = [UIColor blueColor];
    [super viewDidLoad];
    [self loadBasicView];
    [self loadSwipeGesture];
    
}

#pragma mark 加载基本视图
-(void)loadBasicView{
    self.view.backgroundColor = [UIColor yellowColor];
    
    _leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, OriginX, [UIScreen mainScreen].bounds.size.height)];
    _leftView.alpha = 0;
    _leftView.backgroundColor = [UIColor blueColor];
    [[[UIApplication sharedApplication].delegate window] addSubview:_leftView];
    
    UIButton *btnOne = [[UIButton alloc]init];
    [btnOne setBackgroundImage:[UIImage imageNamed:@"5.png"] forState:UIControlStateNormal];
    btnOne.frame = CGRectMake(0, 0, 30, 30);
    [btnOne addTarget:self action:@selector(drawerAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barBtnLeftOne = [[UIBarButtonItem alloc]initWithCustomView:btnOne];
    
    UIButton *btnTwo = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btnTwo setTitle:@"关闭" forState:UIControlStateNormal];
    btnTwo.frame = CGRectMake(0, 0, 30, 30);
    [btnTwo addTarget:self action:@selector(drawerAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barBtnLeftTwo = [[UIBarButtonItem alloc]initWithCustomView:btnTwo];
    self.tabBarController.navigationItem.leftBarButtonItems = @[barBtnLeftOne,barBtnLeftTwo];
}

#pragma mark 加载手势操作
-(void)loadSwipeGesture{
    //添加轻扫手势
    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(drawerAction)];
    //设置轻扫的方向
    swipeGesture.direction = UISwipeGestureRecognizerDirectionRight; //默认向右
    [self.view addGestureRecognizer:swipeGesture];
    //添加轻扫手势
    UISwipeGestureRecognizer *swipeGestureLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(drawerAction)];
    //设置轻扫的方向
    swipeGestureLeft.direction = UISwipeGestureRecognizerDirectionLeft; //默认向右
    [self.view addGestureRecognizer:swipeGestureLeft];
}

#pragma mark 抽屉效果的方法
-(void)drawerAction{
    
    SetViewController *set = [[SetViewController alloc]init];
//    [self.navigationController pushViewController:set animated:YES];
    
    navOriginX = self.navigationController.view.frame.origin.x;
    if (navOriginX == 0) {
        navOriginX = OriginX;
        //开始动画
        [UIView beginAnimations:@"doflip" context:nil];
        //设置时常
        [UIView setAnimationDuration:0.3];
        //设置动画淡入淡出
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        //设置代理
        [UIView setAnimationDelegate:self];
        self.navigationController.view.frame = CGRectMake(navOriginX, 15, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height -30);
        NSLog(@"%f",navOriginX);
        _leftView.alpha = 1.0;
        //动画结束  
        [UIView commitAnimations];
        
    }else{
        navOriginX = 0;
        //开始动画
        [UIView beginAnimations:@"doflip" context:nil];
        //设置时常
        [UIView setAnimationDuration:0.3];
        //设置动画淡入淡出
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        //设置代理
        [UIView setAnimationDelegate:self];
        self.navigationController.view.frame = CGRectMake(navOriginX, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        _leftView.alpha = 0;
        //动画结束
        [UIView commitAnimations];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
