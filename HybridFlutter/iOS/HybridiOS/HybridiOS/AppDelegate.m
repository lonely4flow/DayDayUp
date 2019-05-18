//
//  AppDelegate.m
//  HybridiOS
//
//  Created by lonelyflow on 14/05/2019.
//  Copyright © 2019 Lonely traveller. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseViewController.h"
#import "HomeViewController.h"
#import "MyFlutterRouter.h"


@interface AppDelegate ()
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //BOOL result =  [self.lifeCycleDelegate application:application didFinishLaunchingWithOptions:launchOptions];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    UITabBarController *tabVC = [[UITabBarController alloc] init];

    HomeViewController *vc1 = [HomeViewController new];
    vc1.tabBarItem = [[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemContacts tag:0];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:vc1];

    BaseViewController *vc2 = [BaseViewController new];
    vc2.tabBarItem = [[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemTopRated tag:1];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:vc2];

    BaseViewController *vc3 = [BaseViewController new];
    vc3.tabBarItem = [[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemHistory tag:2];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:vc3];

    BaseViewController *vc4 = [BaseViewController new];
    vc4.tabBarItem = [[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemRecents tag:3];
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:vc4];


    tabVC.viewControllers = @[nav1,nav2,nav3,nav4];
    self.window.rootViewController = tabVC;

//    [FlutterBoostPlugin.sharedInstance startFlutterWithPlatform:[MyFlutterRouter sharedRouter] onStart:^(FlutterViewController * fvc){
//        NSLog(@"%@",fvc);
//    }];
    
    [self.window makeKeyAndVisible];
    return YES;
}
@end
