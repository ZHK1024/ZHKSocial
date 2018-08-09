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
    [UMSocialUIManager setPreDefinePlatforms:[self platforms]];
    [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {
        // 分享
        [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:object currentViewController:self completion:^(id result, NSError *error) {
            if (result) {
                NSLog(@"分享成功!");
            } else {
                NSLog(@"error: %@", error);
            }
        }];
    }];
}

- (NSArray *)platforms {
    NSMutableArray *array = [NSMutableArray arrayWithArray:[UMSocialManager defaultManager].platformTypeArray];
    [array addObject:@(UMSocialPlatformType_Sms)];
    return array;
}

@end
