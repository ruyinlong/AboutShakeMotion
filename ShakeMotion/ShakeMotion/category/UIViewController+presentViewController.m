//
//  UIViewController+presentViewController.m
//  ShakeMotion
//
//  Created by Li Yang on 2017/12/1.
//  Copyright © 2017年 Li Yang. All rights reserved.
//

#import <objc/runtime.h>
#import "UIViewController+presentViewController.h"

#import "SRMethodSwizzler.h"

@implementation UIViewController (presentViewController)

+(void)load
{
    NSLog(@"调用函数：%s", __func__);
    
    SwizzleInstanceMethod(self, @selector(presentViewController:animated:completion:), @selector(sm_presentViewController:animated:completion:));
}

- (void)sm_presentViewController:(UIViewController *)viewControllerToPresent animated: (BOOL)flag completion:(void (^ __nullable)(void))completion
{
    // 已经交换过了，其实调用的是先前的：presentViewController:animated:completion:
    [self sm_presentViewController:viewControllerToPresent animated:false completion:completion];
    
    //发送我们想要的通知：这里直接使用系统的这个通知UIApplicationDidFinishLaunchingNotification了
    [[NSNotificationCenter defaultCenter] postNotificationName:UIApplicationDidFinishLaunchingNotification object:self];
}

@end
