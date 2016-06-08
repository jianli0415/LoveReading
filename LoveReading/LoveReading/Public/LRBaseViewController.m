//
//  LRBaseViewController.m
//  LoveReading
//
//  Created by BJ13041603-002 on 16/6/7.
//  Copyright © 2016年 刘建立. All rights reserved.
//

#import "LRBaseViewController.h"

@interface LRBaseViewController ()

@end

@implementation LRBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        //需要遵循一下手势的代理        self.navigationController.interactivePopGestureRecognizer.delegate = self;
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
