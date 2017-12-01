//
//  BaseVC4+ShakeMotion.m
//  ShakeMotion
//
//  Created by Li Yang on 2017/11/30.
//  Copyright © 2017年 Li Yang. All rights reserved.
//

#import "BaseVC4+ShakeMotion.h"

@implementation BaseVC4 (ShakeMotion)

- (BOOL)canBecomeFirstResponder
{
    NSLog(@"canBecomeFirstResponder in %s", __func__);
    return YES; //默认是NO，所以得重写此方法，设成YES
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"shake motion in %s", __func__);
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"shake motion in %s", __func__);
}

- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"shake motion in %s", __func__);
}

@end
