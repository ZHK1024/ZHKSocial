//
//  UIResponder+UMSocial.m
//  Pods
//
//  Created by ZHK on 2018/8/9.
//
//

#import "AppDelegate+UMSocial.h"
#import "ZHKSocialKeys.h"
#import <UMShare/UMShare.h>
#import <UMCommon/UMCommon.h>
#import <UShareUI/UShareUI.h>
#import "UMSocialManager+Settings.h"

@implementation UIResponder (UMSocial)

#pragma mark -

- (void)registUMSocialWithLaunchOptions:(NSDictionary *)launchOptions {
    NSDictionary *settings = [UMSocialManager settingInfo];
    [self initSDKWithAppKey:settings[UMSocialAppKey] channel:settings[UMSocialChannelKey]];
    [self registPlatforms:settings[UMSocialPlatformKey]];
}

#pragma mark - Settings

/**
 初始化 SDK

 @param appKey  友盟 AppKey
 @param channel 渠道
 */
- (void)initSDKWithAppKey:(NSString *)appKey channel:(NSString *)channel {
    [UMConfigure initWithAppkey:appKey channel:channel];
    // 新浪 SDK 判断是否安装微博, 需要稍作延迟才能获取到准确结果
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UMSocialUIManager setPreDefinePlatforms:[UMSocialManager useablePlatforms]];
    });
}

/**
 注册分享平台

 @param platforms 平台配置数组
 */
- (void)registPlatforms:(NSArray *)platforms {
    for (NSDictionary *platform in platforms) {
        if ([platform[UMSocialPlatformEnableKey] boolValue]) {
            [[UMSocialManager defaultManager] setPlaform:[platform[UMSocialPlatformTypeKey] integerValue] appKey:platform[UMSocialPlatformAppKey] appSecret:platform[UMSocialPlatformAppSecretKey] redirectURL:nil];
        }
    }
}

#pragma mark -

- (BOOL)umsocial_application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    return [[UMSocialManager defaultManager] handleOpenURL:url];
}

@end
