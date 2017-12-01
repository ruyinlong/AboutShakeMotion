//
//  SelfDefineViewController.m
//  ShakeTestSecond
//
//  Created by Li Yang on 2017/11/27.
//  Copyright © 2017年 Li Yang. All rights reserved.
//

#import "SelfDefineViewController.h"
#import "SelfDefineView.h"

@interface SelfDefineViewController ()

@end

@implementation SelfDefineViewController

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
    
    self.title = @"SelfDefine";
    
    //新建一个子view
    SelfDefineView *sdV = [[SelfDefineView alloc] init];
    sdV.backgroundColor = [UIColor yellowColor];
    sdV.frame = self.view.frame;
    [self.view addSubview:sdV];
    
    // Create a tip label
    {
        UILabel *tipLabel = [[UILabel alloc] init];
        tipLabel.frame = CGRectMake(0, 60, sdV.frame.size.width, 240);
        tipLabel.textAlignment = NSTextAlignmentCenter;
        tipLabel.numberOfLines = 7;
        tipLabel.text = @"测试在不同情况下\nshake事件对不同函数的调用情况\n请看Log输出的数据，查看\ncanBecomeFirstResponder函数\nmotionBegan函数\nmotionEnd函数\n的调用情况";
        [sdV addSubview:tipLabel];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
