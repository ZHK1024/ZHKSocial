# ZHKSocial

[![CI Status](https://img.shields.io/travis/389914070@qq.com/ZHKSocial.svg?style=flat)](https://travis-ci.org/389914070@qq.com/ZHKSocial)
[![Version](https://img.shields.io/cocoapods/v/ZHKSocial.svg?style=flat)](https://cocoapods.org/pods/ZHKSocial)
[![License](https://img.shields.io/cocoapods/l/ZHKSocial.svg?style=flat)](https://cocoapods.org/pods/ZHKSocial)
[![Platform](https://img.shields.io/cocoapods/p/ZHKSocial.svg?style=flat)](https://cocoapods.org/pods/ZHKSocial)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

在 Podfile 中添加如下语句:

```ruby
pod 'ZHKSocial', :git=>'https://github.com/ZHK1024/ZHKSocial.git'
```

添加需要的子模块 (需要分享到哪些平台, 添加对应的子模块) :
```
pod 'UMCShare/Social/ReducedWeChat', '~>6.9.4'
pod 'UMCShare/Social/ReducedQQ', '~>6.9.4'
pod 'UMCShare/Social/ReducedSina', '~>6.9.4
```
## Usage

1. 在 **ZHKSocial** -> **Resources** -> **ZHKSocialSettings.plist** 中添加配置:

	```
	Root |-- ZHK.Share (以 BundleId 为 Key, 可以为多个 Target 进行不同配置)
	          |-- kUMengSocialAppKey (友盟 AppKey)
	          |-- kUMengChannelKey (渠道)
	          |-- kPlaforms (分享平台的配置, 可以配置多个平台)
	              |-- name (平台名称, 以免以后不知道哪个是哪个)
	              |-- enable (是否生效, NO, 则不在 App 中体现)
	              |-- kPlatformType (平台类型, 对应友盟 SDK 中的 UMSocialPlatformType 枚举)
	              |-- kAppKey (平台 AppKey)
	              |-- kAppSecret (平台 AppSecret)
	```

2. 复制 **ZHKSocial** -> **Resources** -> **LSApplicationQueriesSchemes.plist** 中的 `LSApplicationQueriesSchemes` 到 `Info.plist` 文件中.
3. 添加 `URLScheme`
4. 代码:
   **AppDelegate.m**
   
   ```
   #import <AppDelegate+UMSocial.h>
   - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
	    [self registUMSocialWithLaunchOptions:launchOptions];
	    return YES;
	}

	- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
	    return [self umsocial_application:application handleOpenURL:url];
	}

   ```
   
   **分享**
   ```
   UMShareWebpageObject *webObj = [UMShareWebpageObject shareObjectWithTitle:@"百度" descr:@"百度首页" thumImage:[UIImage imageNamed:@"Baidu"]];
    webObj.webpageUrl = @"https://www.baidu.com";
    UMSocialMessageObject *msgObj = [UMSocialMessageObject messageObjectWithMediaObject:webObj];
    
    [self showShareMenuWithMsgObject:msgObj];
   ```

## Author

ZHK1024

## License

ZHKSocial is available under the MIT license. See the LICENSE file for more info.


