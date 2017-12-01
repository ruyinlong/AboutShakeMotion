//
//  UIWindow+Motion.h
//  ShakeT
//
//  Created by Li Yang on 2017/11/21.
//  Copyright © 2017年 Li Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWindow (Motion)

// @override
- (BOOL)canBecomeFirstResponder;
- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event;
- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event;
- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event;

@end
