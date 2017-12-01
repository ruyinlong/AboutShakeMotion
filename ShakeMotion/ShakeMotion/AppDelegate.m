//
//  AppDelegate.m
//  ShakeMotion
//
//  Created by Li Yang on 2017/11/30.
//  Copyright © 2017年 Li Yang. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstVC.h"

#import "Aspects/Aspects.h"
#import "MethodSwizzier/SRMethodSwizzler.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    sleep(2);
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor =[UIColor clearColor];
    
    FirstVC *vc = [[FirstVC alloc] init];
    UINavigationController *navC = [[UINavigationController alloc] initWithRootViewController:vc];
    
    self.window.rootViewController = navC;
    
    [self.window makeKeyAndVisible];
    
    // 使用方案一
    //[self addFunctionUseRuntime];
    
    // 使用方案二
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didFinishLaunch:) name:UIApplicationDidFinishLaunchingNotification object:nil];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - 方案一
-(void)didFinishLaunch:(NSNotification *)notification
{
    NSLog(@"收到通知了:%@", notification.name);
    UIViewController *tempVC = (UIViewController *)notification.object;
    
    UIViewController *tempCurrentTopVC = nil;
    
    if ([tempVC isKindOfClass:[UIViewController class]])
    {
        tempCurrentTopVC = [self getTopViewController:tempVC];
    }
    else
    {
        tempCurrentTopVC = [self getTopViewController:self.window.rootViewController];
    }
    
    NSLog(@"解析顶部VC:%@", tempCurrentTopVC);
    
    // 添加方法
    {
        // 设置过滤列表，对列表中的VC，不做任何操作
        // 注意这个奇葩的东西：UIInputWindowController
        // 使用这个方法是有弊端的。
        NSArray *filterLists = @[@"FirstVC", @"FromBaseVC4_VC", @"UIInputWindowController"];
        
        NSString *cName = NSStringFromClass([tempCurrentTopVC class]);
        if (![filterLists containsObject:cName])
        {
            NSLog(@"方法替换开始");
            // 交换方法
            SwizzleInstanceMethod2([tempCurrentTopVC class], @selector(canBecomeFirstResponder),
                                   [self class], @selector(sm_canBecomeFirstResponder));
            // 交换方法
            SwizzleInstanceMethod2([tempCurrentTopVC class], @selector(motionBegan:withEvent:),
                                   [self class], @selector(sm_motionBegan:withEvent:));
            // 交换方法
            SwizzleInstanceMethod2([tempCurrentTopVC class], @selector(motionEnded:withEvent:),
                                   [self class], @selector(sm_motionEnded:withEvent:));
            // 交换方法
            SwizzleInstanceMethod2([tempCurrentTopVC class], @selector(motionCancelled:withEvent:),
                                   [self class], @selector(sm_motionCancelled:withEvent:));
        }
    }
}

-(UIViewController *)getTopViewController:(UIViewController *)viewController
{
    if ([viewController isKindOfClass:[UITabBarController class]])
    {
        return [self getTopViewController:[(UITabBarController *)viewController selectedViewController]];
    }
    else if ([viewController isKindOfClass:[UINavigationController class]])
    {
        return [self getTopViewController:[(UINavigationController *)viewController topViewController]];
    }
    else if (viewController.presentedViewController)
    {
        return [self getTopViewController:viewController.presentedViewController];
    }
    else
    {
        return viewController;
    }
}

#pragma mark - 方案二
-(void)addFunctionUseRuntime
{
    // 设置过滤列表，对列表中的VC，不做任何操作
    // 注意这个奇葩的东西：UIInputWindowController
    // 使用这个方法是有弊端的。
    NSArray *filterLists = @[@"FirstVC", @"FromBaseVC4_VC", @"UIInputWindowController"];
    
    // Hook current VC
    [UIViewController aspect_hookSelector:@selector(viewWillAppear:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> aspectInfo, BOOL animated) {
        
        UIViewController *currentVC = aspectInfo.instance;
        NSLog(@"当前类名：%@", [currentVC class]);
        NSLog(@"注意：View Controller %@ will appear animated: %tu", aspectInfo.instance, animated);
        
        // 为什么只做了这两个判断，看看这个workspace中的其他project就明白了
        //BOOL isExist_motionBegan = [[currentVC class] instancesRespondToSelector:@selector(motionBegan:withEvent:)];
        //BOOL isExist_motionEnded = [currentVC respondsToSelector:@selector(motionEnded:withEvent:)];
        
        NSString *cName = NSStringFromClass([currentVC class]);
        if (![filterLists containsObject:cName])
        {
            NSLog(@"方法替换开始");
            // 交换方法
            SwizzleInstanceMethod2([currentVC class], @selector(canBecomeFirstResponder),
                                   [self class], @selector(sm_canBecomeFirstResponder));
            // 交换方法
            SwizzleInstanceMethod2([currentVC class], @selector(motionBegan:withEvent:),
                                   [self class], @selector(sm_motionBegan:withEvent:));
            // 交换方法
            SwizzleInstanceMethod2([currentVC class], @selector(motionEnded:withEvent:),
                                   [self class], @selector(sm_motionEnded:withEvent:));
            // 交换方法
            SwizzleInstanceMethod2([currentVC class], @selector(motionCancelled:withEvent:),
                                   [self class], @selector(sm_motionCancelled:withEvent:));
        }
    } error:NULL];
}

#pragma mark - 被交换的方法

- (BOOL)sm_canBecomeFirstResponder
{
    NSLog(@"好的：canBecomeFirstResponder in %s", __func__);
    return YES; //默认是NO，所以得重写此方法，设成YES
}

- (void)sm_motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"好的：shake motion in %s", __func__);
}

- (void)sm_motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"好的：shake motion in %s", __func__);
}

- (void)sm_motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"好的：shake motion in %s", __func__);
}

@end
