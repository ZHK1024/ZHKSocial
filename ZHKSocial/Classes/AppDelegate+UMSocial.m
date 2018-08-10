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
    [UMSocialUIManager setPreDefinePlatforms:[UMSocialManager useablePlatforms]];
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
