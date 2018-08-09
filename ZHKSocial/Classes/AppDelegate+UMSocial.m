//
//  UIResponder+UMSocial.m
//  Pods
//
//  Created by ZHK on 2018/8/9.
//
//

#import "AppDelegate+UMSocial.h"
#import <UMShare/UMShare.h>
#import <UMCommon/UMCommon.h>
#import "ZHKSocialKeys.h"

@implementation UIResponder (UMSocial)

- (void)registUMSocialWithLaunchOptions:(NSDictionary *)launchOptions {
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"ZHKSocialBundle" ofType:@"bundle"];
    NSString *settingPath = [[NSBundle bundleWithPath:bundlePath] pathForResource:@"ZHKSocialSettings" ofType:@"plist"];
    
    NSDictionary *settings = [[NSDictionary dictionaryWithContentsOfFile:settingPath] valueForKey:[NSBundle mainBundle].bundleIdentifier];
    
    [UMConfigure initWithAppkey:settings[UMSocialAppKey] channel:nil];
    
    [self registPlatforms:settings[UMSocialPlatformKey]];
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

- (BOOL)umsocial_application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    return [[UMSocialManager defaultManager] handleOpenURL:url];
}

@end
