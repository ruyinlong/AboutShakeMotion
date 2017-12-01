//
//  ViewController1+Motion.m
//  ShakeTestFirst
//
//  Created by Li Yang on 2017/11/26.
//  Copyright © 2017年 Li Yang. All rights reserved.
//

#import "ViewController1+Motion.h"
#import "UIViewController+ShowAltert.h"

@implementation ViewController1 (Motion)

- (BOOL)canBecomeFirstResponder
{
    NSLog(@"判断是否可以为第一响应者的函数：%s", __func__);
    return YES; //默认是NO，所以得重写此方法，设成YES
}

/**
 *  摇动开始
 */
- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"shake响应函数：%s", __func__);

    NSString *tempMsg = [NSString stringWithFormat:@"响应了摇一摇事件：%s", __func__];
    [self showAlterControllerWithMsg:tempMsg];
}

@end
