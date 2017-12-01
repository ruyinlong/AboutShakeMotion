//
//  FirstVC.m
//  ShakeMotion
//
//  Created by Li Yang on 2017/11/30.
//  Copyright © 2017年 Li Yang. All rights reserved.
//

/*
 * 这个类中【没有】响应事件的函数：motionBegan、motionEnded
 */

#import "FirstVC.h"
#import "FromBaseVC1_VC.h"
#import "FromBaseVC2_VC.h"
#import "FromBaseVC3_VC.h"
#import "FromBaseVC4_VC.h"
#import "FromBaseVC5_VC.h"

@interface FirstVC ()

@end

@implementation FirstVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"FirstVC";
    self.view.backgroundColor = [UIColor whiteColor];

    // Create a button
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(self.view.frame.size.width/2.0 - 80, 100, 160, 40);
        button.layer.borderWidth = 1.0;
        [button setTitle:@"JumpTo：VC-1" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        button.tag = 100;
    }
    
    // Create a button
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(self.view.frame.size.width/2.0 - 80, 160, 160, 40);
        button.layer.borderWidth = 1.0;
        [button setTitle:@"JumpTo：VC-2" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        button.tag = 200;
    }
    
    // Create a button
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(self.view.frame.size.width/2.0 - 80, 220, 160, 40);
        button.layer.borderWidth = 1.0;
        [button setTitle:@"JumpTo：VC-3" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        button.tag = 300;
    }
    
    // Create a button
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(self.view.frame.size.width/2.0 - 80, 280, 160, 40);
        button.layer.borderWidth = 1.0;
        [button setTitle:@"JumpTo：VC-4" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        button.tag = 400;
    }
    
    // Create a button
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(self.view.frame.size.width/2.0 - 80, 340, 160, 40);
        button.layer.borderWidth = 1.0;
        [button setTitle:@"JumpTo：VC-5" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        button.tag = 500;
    }
}

- (void)buttonAction:(UIButton*)sender
{
    switch (sender.tag)
    {
        case 100:
        {
            FromBaseVC1_VC *vc = [[FromBaseVC1_VC alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 200:
        {
            FromBaseVC2_VC *vc = [[FromBaseVC2_VC alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 300:
        {
            FromBaseVC3_VC *vc = [[FromBaseVC3_VC alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 400:
        {
            FromBaseVC4_VC *vc = [[FromBaseVC4_VC alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 500:
        {
            FromBaseVC5_VC *vc = [[FromBaseVC5_VC alloc] init];
            //[self.navigationController pushViewController:vc animated:YES];
            [self presentViewController:vc animated:YES completion:nil];
        }
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
