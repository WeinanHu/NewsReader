//
//  ViewController.m
//  testnews
//
//  Created by Way_Lone on 2017/10/12.
//  Copyright © 2017年 waynehu. All rights reserved.
//

#import "ViewController.h"
#import "NewsWebViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"open news" forState:UIControlStateNormal];
    button.frame = self.view.bounds;
    [self.view addSubview:button];
    [button addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)clickButton{
    NewsWebViewController *nwc = [[NewsWebViewController alloc]init];
    [self.navigationController pushViewController:nwc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
