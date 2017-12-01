//
//  FromBaseVC1_VC.m
//  ShakeMotion
//
//  Created by Li Yang on 2017/11/30.
//  Copyright © 2017年 Li Yang. All rights reserved.
//

/*
 * 这个类中【没有】响应事件的函数：motionBegan、motionEnded
 * 但是其父类BaseVC1中 【有】。
 */

#import "FromBaseVC1_VC.h"

@interface FromBaseVC1_VC ()

@end

@implementation FromBaseVC1_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"VC-1";
    self.view.backgroundColor = [UIColor redColor];
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
