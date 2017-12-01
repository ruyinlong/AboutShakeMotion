//
//  ChildViewController.m
//  LoadMethodT
//
//  Created by Li Yang on 2017/11/26.
//  Copyright © 2017年 Li Yang. All rights reserved.
//

#import "ChildViewController.h"

@interface ChildViewController ()

@end

@implementation ChildViewController

+(void)load
{
    NSLog(@"调用函数：%s", __func__);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"Load Method";
    self.view.backgroundColor = [UIColor yellowColor];
    //self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backGround.png"]];
    //self.view.layer.contents = (id)[UIImage imageNamed:@"backGround.png"].CGImage;
    
    // Create a tip label
    {
        UILabel *tipLabel = [[UILabel alloc] init];
        tipLabel.frame = CGRectMake(0, 60, self.view.frame.size.width, 120);
        tipLabel.textAlignment = NSTextAlignmentCenter;
        tipLabel.numberOfLines = 3;
        tipLabel.text = @"测试load方法的加载顺序\n请看Log输出的数据\n查看父类、子类、类别中load函数的调用顺序";
        [self.view addSubview:tipLabel];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
