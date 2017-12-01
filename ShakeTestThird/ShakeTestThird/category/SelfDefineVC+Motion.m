//
//  SelfDefineVC+Motion.m
//  ShakeTestThird
//
//  Created by Li Yang on 2017/11/27.
//  Copyright © 2017年 Li Yang. All rights reserved.
//

#import "SelfDefineVC+Motion.h"

@implementation SelfDefineVC (Motion)

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
