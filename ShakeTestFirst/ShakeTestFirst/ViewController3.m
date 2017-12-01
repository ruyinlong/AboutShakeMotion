//
//  ViewController3.m
//  ShakeTestFirst
//
//  Created by Li Yang on 2017/11/26.
//  Copyright © 2017年 Li Yang. All rights reserved.
//

#import "ViewController3.h"
#import "category/UIViewController+ShowAltert.h"

@interface ViewController3 ()

@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 查询是否是第一响应者
    NSString *selfClass = NSStringFromClass([self class]);
    if ([self canBecomeFirstResponder])
    {
        NSLog(@"%@，可以成为第一响应者, %s", selfClass, __func__);
    }
    else
    {
        NSLog(@"%@，可以成为第一响应者, %s", selfClass, __func__);
    }
    
    self.title = @"VC-3";
    self.view.backgroundColor = [UIColor redColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
