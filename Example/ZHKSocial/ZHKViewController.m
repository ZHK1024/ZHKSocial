//
//  ZHKViewController.m
//  ZHKSocial
//
//  Created by 389914070@qq.com on 08/09/2018.
//  Copyright (c) 2018 389914070@qq.com. All rights reserved.
//

#import "ZHKViewController.h"
#import <UIViewController+UMSocial.h>

@interface ZHKViewController ()

@end

@implementation ZHKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)shareAction:(UIButton *)sender {
    [self showShareMenu];
}

@end
