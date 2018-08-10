//
//  UMSocialManager+Settings.m
//  Pods
//
//  Created by ZHK on 2018/8/10.
//
//

#import "UMSocialManager+Settings.h"
#import "ZHKSocialKeys.h"

@implementation UMSocialManager (Settings)

+ (NSDictionary *)settingInfo {
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"ZHKSocialBundle" ofType:@"bundle"];
    NSString *settingPath = [[NSBundle bundleWithPath:bundlePath] pathForResource:@"ZHKSocialSettings" ofType:@"plist"];
    return [[NSDictionary dictionaryWithContentsOfFile:settingPath] valueForKey:[NSBundle mainBundle].bundleIdentifier];
}

+ (NSArray *)useablePlatforms {
    NSMutableArray *useable = [NSMutableArray new];
    NSArray *platformTypeArray = [UMSocialManager defaultManager].platformTypeArray;
    for (NSDictionary *platform in [self settingInfo][UMSocialPlatformKey]) {
        NSNumber *platformType = platform[UMSocialPlatformTypeKey];
        
        // 过滤 新浪微博
        if (platformType.integerValue == UMSocialPlatformType_Sina &&
            [[UMSocialManager defaultManager] isInstall:UMSocialPlatformType_Sina] == NO) {
            continue;
        }
        // 过滤未开启的平台
        if ([platform[UMSocialPlatformEnableKey] boolValue] &&
            [platformTypeArray containsObject:platform[UMSocialPlatformTypeKey]]) {
            [useable addObject:platform[UMSocialPlatformTypeKey]];
        }
    }
    // 默认至少开启 SMS, 免得审核时候一片空白
    [useable addObject:@(UMSocialPlatformType_Sms)];
    return useable;
}

@end
