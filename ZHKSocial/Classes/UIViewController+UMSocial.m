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

- (void)showShareMenuWithMsgObject:(UMSocialMessageObject *)object {
    __weak typeof(self) ws = self;
    [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {
        // 分享
        [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:object currentViewController:ws completion:^(id result, NSError *error) {
            if (result) {
                NSLog(@"分享成功!");
            } else {
                NSLog(@"error: %@", error);
            }
        }];
    }];
}

@end
