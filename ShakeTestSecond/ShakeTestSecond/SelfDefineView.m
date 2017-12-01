//
//  SelfDefineView.m
//  ShakeTestSecond
//
//  Created by Li Yang on 2017/11/27.
//  Copyright © 2017年 Li Yang. All rights reserved.
//

#import "SelfDefineView.h"

@implementation SelfDefineView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // 查询是否是可以成为第一响应者
        NSString *selfClass = NSStringFromClass([self class]);
        if ([self canBecomeFirstResponder])
        {
            NSLog(@"%@，可以成为第一响应者, %s", selfClass, __func__);
        }
        else
        {
            NSLog(@"%@，不可以成为第一响应者, %s", selfClass, __func__);
        }
        
        return self;
    }
    
    return nil;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
