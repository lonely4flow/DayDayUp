#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
#import <Flutter/Flutter.h>
@interface AppDelegate() <FlutterStreamHandler>
@end
@implementation AppDelegate
{
     FlutterEventSink _eventSink;
}
- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
    
    // 设置flutter主动调用Native
    [self setupFlutterCallNative];
    // 设置native主动调用flutter
    [self setupNativeCallFlutter];

    
  // Override point for customization after application launch.
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}
#pragma mark - FlutterCallNative
- (void)setupFlutterCallNative
{
    FlutterViewController *controller = (FlutterViewController *)self.window.rootViewController;
    
    // 用于Flutter 调用 Native
    // 这个channelname必须与Native里接收的一致
    FlutterMethodChannel *batteryChannel = [FlutterMethodChannel methodChannelWithName:@"samples.flutter.io/flutterCallNative" binaryMessenger:controller];
    
    __weak __typeof(self)weakSelf = self;
    [batteryChannel setMethodCallHandler:^(FlutterMethodCall *call, FlutterResult result) {
        NSLog(@"method: %@",call.method);
        NSLog(@"arguments: %@",call.arguments);
        if([@"getBatteryLevel" isEqualToString:call.method]){
            NSInteger batteryLevel = [weakSelf getBatteryLevel];
            if(-1 == batteryLevel){
                result([FlutterError errorWithCode:@"UNAVAILABLE"
                                           message:@"Battery info unavailable2222"
                                           details:nil]);
            }else{
                result(@(batteryLevel));
            }
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
        }
        else{
            result(FlutterMethodNotImplemented);
        }
        
    }];
}
- (NSInteger)getBatteryLevel
{
    UIDevice* device = UIDevice.currentDevice;
    device.batteryMonitoringEnabled = YES;
    if (device.batteryState == UIDeviceBatteryStateUnknown) {
        return -1;
    } else {
        return device.batteryLevel * 100;
    }
}

#pragma mark - NativeCallFlutter
- (void)setupNativeCallFlutter
{
    FlutterViewController *controller = (FlutterViewController *)self.window.rootViewController;
    // 用于Native调用Flutter
    FlutterEventChannel *eventChanel = [FlutterEventChannel eventChannelWithName:@"samples.flutter.io/nativeCallFlutter" binaryMessenger:controller];
    [eventChanel setStreamHandler:self];
}
- (FlutterError *)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)events
{
    _eventSink = events;
    static NSInteger mm = 0;
    [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        if (!_eventSink) return;
        NSString *txt = [NSString stringWithFormat:@"    iOS倒计时 %ld秒",++mm];
        _eventSink(txt);
    }];
    return nil;
}
- (FlutterError*)onCancelWithArguments:(id)arguments {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    _eventSink = nil;
    return nil;
}
@end
