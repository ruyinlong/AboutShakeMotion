//
//  UINavigationController+pushViewController.m
//  ShakeMotion
//
//  Created by Li Yang on 2017/12/1.
//  Copyright © 2017年 Li Yang. All rights reserved.
//

#import <objc/runtime.h>
#import "UINavigationController+pushViewController.h"

#import "SRMethodSwizzler.h"

@implementation UINavigationController (pushViewController)

+(void)load
{
    NSLog(@"UINavigationController类别中调用函数：%s", __func__);
    
    SwizzleInstanceMethod(self, @selector(pushViewController:animated:), @selector(sm_pushViewController:animated:));
}

- (void)sm_pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    // 已经交换过了，其实调用的是先前的：pushViewController:animated:
    [self sm_pushViewController:viewController animated:animated];
    
    NSLog(@"UINavigationController类别中发送通知：%s", __func__);
    //发送我们想要的通知：这里直接使用系统的这个通知UIApplicationDidFinishLaunchingNotification了
    [[NSNotificationCenter defaultCenter] postNotificationName:UIApplicationDidFinishLaunchingNotification object:self];
}

- (nullable UIViewController *)sm_popViewControllerAnimated:(BOOL)animated
{
    // 注意！！！接下来要完善一点：取消接收通知事件。
    return [self sm_popViewControllerAnimated:animated];
}

@end
