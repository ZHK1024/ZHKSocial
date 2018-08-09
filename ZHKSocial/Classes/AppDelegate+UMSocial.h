//
//  UIResponder+UMSocial.h
//  Pods
//
//  Created by ZHK on 2018/8/9.
//
//

#import <UIKit/UIKit.h>

@interface UIResponder (UMSocial)

- (void)registUMSocialWithLaunchOptions:(NSDictionary *)launchOptions;

- (BOOL)umsocial_application:(UIApplication *)application handleOpenURL:(NSURL *)url;

@end
