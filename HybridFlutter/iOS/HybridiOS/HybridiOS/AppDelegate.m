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
//@property(nonatomic, strong) FlutterPluginAppLifeCycleDelegate *lifeCycleDelegate;
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

    [self.window makeKeyAndVisible];

    [FlutterBoostPlugin.sharedInstance startFlutterWithPlatform:[MyFlutterRouter sharedRouter] onStart:^(FlutterViewController * fvc){
        NSLog(@"%@",fvc);
     }];
    return YES;
}

/*
- (void)applicationWillResignActive:(UIApplication *)application
{
    [self.lifeCycleDelegate applicationWillResignActive:application];
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    [self.lifeCycleDelegate applicationDidEnterBackground:application];
}


- (void)applicationWillEnterForeground:(UIApplication *)application
{
    [self.lifeCycleDelegate applicationWillEnterForeground:application];
}


- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [self.lifeCycleDelegate applicationDidBecomeActive:application];
}


- (void)applicationWillTerminate:(UIApplication *)application
{
    [self.lifeCycleDelegate applicationWillTerminate:application];
}
- (void)application:(UIApplication*)application
didRegisterUserNotificationSettings:(UIUserNotificationSettings*)notificationSettings
{
    [self.lifeCycleDelegate application:application
didRegisterUserNotificationSettings:notificationSettings];
}

- (void)application:(UIApplication*)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken
{
    [self.lifeCycleDelegate application:application
didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
}

- (void)application:(UIApplication*)application
didReceiveRemoteNotification:(NSDictionary*)userInfo
fetchCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler
{
    [self.lifeCycleDelegate application:application
       didReceiveRemoteNotification:userInfo
             fetchCompletionHandler:completionHandler];
}

- (BOOL)application:(UIApplication*)application
            openURL:(NSURL*)url
            options:(NSDictionary<UIApplicationOpenURLOptionsKey, id>*)options
{
    return [self.lifeCycleDelegate application:application openURL:url options:options];
}

- (BOOL)application:(UIApplication*)application handleOpenURL:(NSURL*)url
{
    return [self.lifeCycleDelegate application:application handleOpenURL:url];
}

- (BOOL)application:(UIApplication*)application
            openURL:(NSURL*)url
  sourceApplication:(NSString*)sourceApplication
         annotation:(id)annotation
{
    return [self.lifeCycleDelegate application:application
                                   openURL:url
                         sourceApplication:sourceApplication
                                annotation:annotation];
}

- (void)application:(UIApplication*)application
performActionForShortcutItem:(UIApplicationShortcutItem*)shortcutItem
  completionHandler:(void (^)(BOOL succeeded))completionHandler NS_AVAILABLE_IOS(9_0)
{
    [self.lifeCycleDelegate application:application
       performActionForShortcutItem:shortcutItem
                  completionHandler:completionHandler];
}

- (void)application:(UIApplication*)application
handleEventsForBackgroundURLSession:(nonnull NSString*)identifier
  completionHandler:(nonnull void (^)(void))completionHandler
{
    [self.lifeCycleDelegate application:application
handleEventsForBackgroundURLSession:identifier
                  completionHandler:completionHandler];
}

- (void)application:(UIApplication*)application
performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult result))completionHandler
{
    [self.lifeCycleDelegate application:application performFetchWithCompletionHandler:completionHandler];
}

- (void)addApplicationLifeCycleDelegate:(NSObject*)delegate {
    [self.lifeCycleDelegate addDelegate:delegate];
}
#pragma mark - getter && setter
- (FlutterPluginAppLifeCycleDelegate *)lifeCycleDelegate
{
    if (_lifeCycleDelegate == nil) {
        _lifeCycleDelegate = [FlutterPluginAppLifeCycleDelegate new];
    }
    return _lifeCycleDelegate;
}
 */
@end
