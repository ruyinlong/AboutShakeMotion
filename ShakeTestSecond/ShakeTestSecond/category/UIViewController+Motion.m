//
//  UIViewController+Motion.m
//  ShakeT
//
//  Created by Li Yang on 2017/11/23.
//  Copyright © 2017年 Li Yang. All rights reserved.
//

#import "UIViewController+Motion.h"

@implementation UIViewController (Motion)

- (BOOL)canBecomeFirstResponder
{
    NSLog(@"canBecomeFirstResponder in %s", __func__);
    return YES; //默认是NO，所以得重写此方法，设成YES
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"motion in %s", __func__);
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"motion in %s", __func__);
}

- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"motion in %s", __func__);
}

@end
