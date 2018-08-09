//
//  UIViewController+UMSocial.h
//  Pods
//
//  Created by ZHK on 2018/8/9.
//
//

#import <UIKit/UIKit.h>
#import <UMShare/UMSocialMessageObject.h>

@interface UIViewController (UMSocial)

- (void)showShareMenuWithMsgObject:(UMSocialMessageObject *)object;

@end
