//
//  SelfDefineVC.m
//  ShakeTestThird
//
//  Created by Li Yang on 2017/11/27.
//  Copyright © 2017年 Li Yang. All rights reserved.
//

#import "SelfDefineVC.h"
#import <CoreMotion/CoreMotion.h>  

@interface SelfDefineVC ()

@property (strong,nonatomic) CMMotionManager *motionManager;

@end

@implementation SelfDefineVC

-(void)viewDidDisappear:(BOOL)animated
{
    //停止加速仪更新（很重要！）
    [self.motionManager stopAccelerometerUpdates];
}

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
    
    self.title = @"SelfDefineVC";
    self.view.backgroundColor = [UIColor yellowColor];
    
    // Create a tip label
    {
        UILabel *tipLabel = [[UILabel alloc] init];
        tipLabel.frame = CGRectMake(0, 60, self.view.frame.size.width, 240);
        tipLabel.textAlignment = NSTextAlignmentCenter;
        tipLabel.numberOfLines = 0;
        tipLabel.text = @"测试使用CMMotionManager调用系统硬件时，Shake事件的几个相关方法\ncanBecomeFirstResponder函数\nmotionBegan函数\nmotionEnd函数\n是否还能正常响应";
        [self.view addSubview:tipLabel];
    }
    
    // 下面是采集硬件信息
    {
        // 创建CMMotionManager对象
        self.motionManager = [[CMMotionManager alloc] init];
        // 如果CMMotionManager的支持获取加速度数据
        if (self.motionManager.accelerometerAvailable)
        {
            //[self.motionManager startAccelerometerUpdates];
            self.motionManager.accelerometerUpdateInterval= 0.1; //设定每0.1秒更新一次数据
        }
        else
        {
            NSLog(@"该设备不支持获取加速度数据！");
        }
        
        //此方法每0.1秒就会返回一次 x y z数据
        //如果使用下面的方法，这个函数[self.motionManager startAccelerometerUpdates]就不需要调用了
        [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
            if (error)
            {
                NSLog(@"accelerometerData error:%@", error);
            }
            else
            {
                //重力再各个轴上的分量
                NSString *str = [NSString stringWithFormat:@"加速计:X:%.3f, Y:%.3f, Z:%.3f",accelerometerData.acceleration.x,accelerometerData.acceleration.y,accelerometerData.acceleration.z];
                NSLog(@"加速度%@", str);
            }
        }];
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
