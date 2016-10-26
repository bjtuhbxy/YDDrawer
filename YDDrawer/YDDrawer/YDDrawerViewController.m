//
//  YDDrawerViewController.m
//  YDDrawer
//
//  Created by apple on 16/6/19.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "YDDrawerViewController.h"
#import "HomeViewController.h"

@interface YDDrawerViewController ()
{
    UINavigationController *_nav;
    UITabBarController *_tab;
}
@end

@implementation YDDrawerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    HomeViewController *home = [[HomeViewController alloc]init];
    _tab = [[UITabBarController alloc]init];
    _tab.viewControllers = @[home];
    _nav = [[UINavigationController alloc]initWithRootViewController:_tab];
    [[UIApplication sharedApplication].delegate window].rootViewController = _nav;
    
    
}

-(void)viewDidAppear:(BOOL)animated{

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
