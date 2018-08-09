//
//  UIViewController+UMSocial.m
//  Pods
//
//  Created by ZHK on 2018/8/9.
//
//

#import "UIViewController+UMSocial.h"
#import <UShareUI/UShareUI.h>

@implementation UIViewController (UMSocial)

- (void)showShareMenu {
    [UMSocialUIManager setPreDefinePlatforms:[UMSocialManager defaultManager].platformTypeArray];
    [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {
        
    }];
}

@end
