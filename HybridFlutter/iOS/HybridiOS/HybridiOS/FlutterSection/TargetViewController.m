//
//  TargetViewController.m
//  HybridiOS
//
//  Created by loneylyflow on 15/05/2019.
//  Copyright © 2019 Lonely traveller. All rights reserved.
//

#import "TargetViewController.h"
#import <Flutter/Flutter.h>
@interface TargetViewController () <FlutterStreamHandler>

@end

@implementation TargetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"TargetViewController";
    self.view.backgroundColor = [UIColor whiteColor];
}
    
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
    
- (void)pushFlutterViewController_EventChannel {
    FlutterViewController* flutterViewController = [[FlutterViewController alloc] initWithProject:nil nibName:nil bundle:nil];
    flutterViewController.navigationItem.title = @"Demo";
    [flutterViewController setInitialRoute:@"home"];
    // 要与main.dart中一致
    NSString *channelName = @"com.pages.your/native_post";
    
    FlutterEventChannel *evenChannal = [FlutterEventChannel eventChannelWithName:channelName binaryMessenger:flutterViewController];
    // 代理FlutterStreamHandler
    [evenChannal setStreamHandler:self];
    
    [self.navigationController pushViewController:flutterViewController animated:YES];
}
    
#pragma mark - <FlutterStreamHandler>
    // // 这个onListen是Flutter端开始监听这个channel时的回调，第二个参数 EventSink是用来传数据的载体。
- (FlutterError* _Nullable)onListenWithArguments:(id _Nullable)arguments
                                       eventSink:(FlutterEventSink)events {
    // arguments flutter给native的参数
    // 回调给flutter， 建议使用实例指向，因为该block可以使用多次
    if (events) {
        events(@"push传值给flutter的vc");
    }
    return nil;
}
    
    /// flutter不再接收
- (FlutterError* _Nullable)onCancelWithArguments:(id _Nullable)arguments {
    // arguments flutter给native的参数
    NSLog(@"%@", arguments);
    return nil;
}
    
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self pushFlutterViewController_EventChannel];
}
@end
