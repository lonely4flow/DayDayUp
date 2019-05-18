//
//  MyFlutterRouter.m
//  HybridiOS
//
//  Created by loneylyflow on 15/05/2019.
//  Copyright © 2019 Lonely traveller. All rights reserved.
//

#import "MyFlutterRouter.h"
#import "MyFlutterViewController.h"
#import <UIKit/UIKit.h>
#import "UINavigationController+FDFullscreenPopGesture.h"

@interface MyFlutterRouter() <FlutterStreamHandler>
@property(nonatomic, copy) FlutterEventSink eventSink;
@property(nonatomic, strong) UINavigationController *navigationController;
@end

@implementation MyFlutterRouter
  
+ (instancetype)sharedRouter
{
    static MyFlutterRouter *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[MyFlutterRouter alloc] init];
        // 在这里初始化FlutterViewController
        // 初始化Router
        [FlutterBoostPlugin.sharedInstance startFlutterWithPlatform:_instance onStart:^(FlutterViewController * fvc){
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.001 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                MyFlutterRouter.sharedRouter.flutterViewController = fvc;
                [MyFlutterRouter.sharedRouter setupFlutterCallNative];
                [MyFlutterRouter.sharedRouter setupNativeCallFlutter];
            });
        }];
    });
    return _instance;
}
#pragma mark - FlutterCallNative
- (void)setupFlutterCallNative
{
    // 用于Flutter 调用 Native
    // 这个channelname必须与Native里接收的一致
    FlutterMethodChannel *batteryChannel = [FlutterMethodChannel methodChannelWithName:@"samples.flutter.io/flutterCallNative" binaryMessenger:self.flutterViewController];
    
    [batteryChannel setMethodCallHandler:^(FlutterMethodCall *call, FlutterResult result) {
        NSLog(@"method: %@",call.method);
        NSLog(@"arguments: %@",call.arguments);
        if([@"getBatteryLevel" isEqualToString:call.method]){
//            result([FlutterError errorWithCode:@"UNAVAILABLE"
//                                       message:@"iOS ====== Battery info unavailable2222"
//                                       details:nil]);
            result(@"Battery info iOS 1234567");
        }else if([@"updateUserInfo" isEqualToString:call.method]){
            NSDictionary *params = call.arguments;
            NSInteger userId = [params[@"id"] integerValue];
            NSString *name = params[@"name"];
            result(@{@"id":@1000,
                     @"name":@"story",
                     @"fromId":@(userId),
                     @"fromName":name
                     });
        }else if([@"nativeCallFlutter" isEqualToString:call.method]){
            //batteryChannel cal
        }else if([@"isShowNav" isEqualToString:call.method]){
           result(@(! self.navigationController.childViewControllers.lastObject.fd_prefersNavigationBarHidden));
            
        }else if([@"hideNav" isEqualToString:call.method]){
            self.navigationController.childViewControllers.lastObject.fd_prefersNavigationBarHidden = YES;
            BOOL animited = [call.arguments boolValue];
            [self.navigationController setNavigationBarHidden:YES animated:animited];
            result(@(NO));
        }else if([@"showNav" isEqualToString:call.method]){
            self.navigationController.childViewControllers.lastObject.fd_prefersNavigationBarHidden = NO;
            BOOL animited = [call.arguments boolValue];
            [self.navigationController setNavigationBarHidden:NO animated:animited];
            result(@(YES));
        }
        else{
            result(FlutterMethodNotImplemented);
        }
        
    }];
}
#pragma mark - NativeCallFlutter
- (void)setupNativeCallFlutter
{
    // 用于Native调用Flutter
    FlutterEventChannel *eventChanel = [FlutterEventChannel eventChannelWithName:@"samples.flutter.io/nativeCallFlutter" binaryMessenger:self.flutterViewController];
    [eventChanel setStreamHandler:self];
}
- (FlutterError *)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)events
{
    self.eventSink = events;
//    static NSInteger mm = 0;
//    [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        if (!_eventSink) return;
//        NSString *txt = [NSString stringWithFormat:@"    iOS倒计时 %ld秒",++mm];
//        _eventSink(txt);
//    }];
    return nil;
}
- (FlutterError*)onCancelWithArguments:(id)arguments {
    //[[NSNotificationCenter defaultCenter] removeObserver:self];
    self.eventSink = nil;
    return nil;
}
- (void)callFluterWithName:(NSString *)name params:(id)params
{
    if(self.eventSink){
        self.eventSink(@{@"name":name?:@"",@"params":params ?: [NSNull null]});
    }else{
        WS(weakSelf)
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf callFluterWithName:name params:params];
        });
    }
}
#pragma mark - push/pop/close
- (void)openPage:(NSString *)name params:(NSDictionary *)params animated:(BOOL)animated completion:(void (^)(BOOL))completion
{
        if([params[@"present"] boolValue]){
            MyFlutterViewController *vc = MyFlutterViewController.new;
            [vc setName:name params:params];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController presentViewController:vc animated:animated completion:^{}];
        }else{
            MyFlutterViewController *vc = MyFlutterViewController.new;
            vc.hidesBottomBarWhenPushed = YES;
            [vc setName:name params:params];
            [self.navigationController pushViewController:vc animated:animated];
        }
    }
    
    
- (void)closePage:(NSString *)uid animated:(BOOL)animated params:(NSDictionary *)params completion:(void (^)(BOOL))completion
{
    FLBFlutterViewContainer *vc = (id)self.navigationController.presentedViewController;
    if([vc isKindOfClass:FLBFlutterViewContainer.class] && [vc.uniqueIDString isEqual: uid]){
        [vc dismissViewControllerAnimated:animated completion:^{}];
    }else{
        [self.navigationController popViewControllerAnimated:animated];
    }
}
- (UINavigationController *)navigationController
{
    UITabBarController *tabVC = (UITabBarController *)[UIApplication sharedApplication].delegate.window.rootViewController;
    if([tabVC isKindOfClass:[UITabBarController class]]){
        UINavigationController *nav = (UINavigationController *)tabVC.selectedViewController;
        if([nav isKindOfClass:[UINavigationController class]]){
            return nav;
        }else{
            return [[UINavigationController alloc] init];
        }
    }
    return [[UINavigationController alloc] init];
}
@end
