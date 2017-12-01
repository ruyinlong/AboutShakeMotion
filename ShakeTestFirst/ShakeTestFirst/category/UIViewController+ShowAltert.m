//
//  UIViewController+ShowAltert.m
//  ShakeTestFirst
//
//  Created by Li Yang on 2017/11/26.
//  Copyright © 2017年 Li Yang. All rights reserved.
//

#import "UIViewController+ShowAltert.h"

@implementation UIViewController (ShowAltert)

- (void)showAlterControllerWithMsg:(NSString *)msg
{
    UIAlertController *alterController = [UIAlertController alertControllerWithTitle:@"提示"
                                                                             message:msg
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:@"取消"
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * _Nonnull action) {
                                                         }];
    
    UIAlertAction *actionSubmit = [UIAlertAction actionWithTitle:@"确定"
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * _Nonnull action) {
                                                         }];
    
    [alterController addAction:actionCancel];
    [alterController addAction:actionSubmit];
    [self presentViewController:alterController animated:YES completion:^{
    }];
}

@end
