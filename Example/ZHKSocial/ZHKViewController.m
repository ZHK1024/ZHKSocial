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
    UMShareWebpageObject *webObj = [UMShareWebpageObject shareObjectWithTitle:@"百度" descr:@"百度首页" thumImage:[UIImage imageNamed:@"Baidu"]];
    webObj.webpageUrl = @"https://www.baidu.com";
    UMSocialMessageObject *msgObj = [UMSocialMessageObject messageObjectWithMediaObject:webObj];
    
    [self showShareMenuWithMsgObject:msgObj];
}

@end
