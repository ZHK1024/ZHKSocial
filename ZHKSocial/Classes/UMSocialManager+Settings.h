//
//  UMSocialManager+Settings.h
//  Pods
//
//  Created by ZHK on 2018/8/10.
//
//

#import <UMShare/UMShare.h>

@interface UMSocialManager (Settings)

/**
 分享配置信息
 */
+ (NSDictionary *)settingInfo;


/**
 综合 SDK, 自定义配置 的最终可用平台
 */
+ (NSArray *)useablePlatforms;

@end
