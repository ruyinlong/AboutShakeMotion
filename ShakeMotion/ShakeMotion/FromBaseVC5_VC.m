//
//  FromBaseVC5_VC.m
//  ShakeMotion
//
//  Created by Li Yang on 2017/11/30.
//  Copyright © 2017年 Li Yang. All rights reserved.
//

/*
 * 这个类中和其父类BaseVC5中【都没有】响应事件的函数：motionBegan、motionEnded
 * 但是其类别中【有】。
 */

#import "FromBaseVC5_VC.h"

@interface FromBaseVC5_VC ()

@end

@implementation FromBaseVC5_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"VC-5";
    self.view.backgroundColor = [UIColor orangeColor];
    
    // Create a button
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(self.view.frame.size.width/2.0 - 80, 220, 160, 40);
        button.layer.borderWidth = 1.0;
        [button setTitle:@"DismissVC" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        button.tag = 300;
    }
}

- (void)buttonAction:(UIButton*)sender
{
    switch (sender.tag)
    {
        case 300:
        {
            [self dismissViewControllerAnimated:YES completion:nil];
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
