//
//  ViewController1.m
//  ShakeTestFirst
//
//  Created by Li Yang on 2017/11/26.
//  Copyright © 2017年 Li Yang. All rights reserved.
//

#import "ViewController1.h"
#import "ViewController2.h"
#import "ViewController3.h"
#import "category/UIViewController+ShowAltert.h"

@interface ViewController1 ()

@end

@implementation ViewController1

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
    
    self.title = @"VC-1";
    self.view.backgroundColor = [UIColor yellowColor];
    
    // Create a tip label
    {
        UILabel *tipLabel = [[UILabel alloc] init];
        tipLabel.frame = CGRectMake(0, 60, self.view.frame.size.width, 240);
        tipLabel.textAlignment = NSTextAlignmentCenter;
        tipLabel.numberOfLines = 6;
        tipLabel.text = @"测试在不同情况下是否响应shake事件\n请看Log输出的数据，查看\ncanBecomeFirstResponder函数\nmotionBegan函数\nmotionEnd函数\n的调用情况";
        [self.view addSubview:tipLabel];
    }
    
     // Create a button
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(self.view.frame.size.width/2.0 - 80, 280, 160, 40);
        button.layer.borderWidth = 1.0;
        [button setTitle:@"JumpTo：VC-2" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        button.tag = 200;
    }
    
    // Create a button
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(self.view.frame.size.width/2.0 - 80, 380, 160, 40);
        button.layer.borderWidth = 1.0;
        [button setTitle:@"JumpTo：VC-3" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        button.tag = 300;
    }
}

- (void)buttonAction:(UIButton*)sender
{
    switch (sender.tag)
    {
        case 200:
        {
            ViewController2 *vc = [[ViewController2 alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 300:
        {
            ViewController3 *vc = [[ViewController3 alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)canBecomeFirstResponder
{
    NSLog(@"判断是否可以为第一响应者的函数：%s", __func__);
    return NO; //默认是NO，所以得重写此方法，设成YES
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
