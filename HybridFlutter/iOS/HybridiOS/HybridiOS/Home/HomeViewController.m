//
//  HomeViewController.m
//  MainSubControllerDemo
//
//  Created by LonelyFlow on 11/05/2019.
//  Copyright © 2019 Lonely traveller. All rights reserved.
//

#import "HomeViewController.h"
#import <flutter_boost/FlutterBoost.h>
#import "MyFlutterViewController.h"
#import "TargetViewController.h"
@interface HomeViewController ()
@property(nonatomic, strong) NSMutableArray *dataList;
@end

@implementation HomeViewController
#pragma mark - lifeCircle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"首页";
//    if (@available(iOS 7.0, *)) {
//        // 让导航栏不是渐变色，变成没有穿透效果的纯色
//        self.edgesForExtendedLayout = UIRectEdgeNone;
//        self.automaticallyAdjustsScrollViewInsets = NO;
//    }
    [self setupUI];
    [self setupLayout];
    [self setupDatas];
}
- (void)setupDatas
{
    [self.dataList addObject:[BaseCellModel modelWithTitle:@"跳转到Flutter" clazz:[BaseViewController class]]];
}
- (void)setupUI
{
    [self.view addSubview:self.tableView];
}
- (void)setupLayout
{
    self.tableView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight-kNavgationHeight);
}
#pragma mark - actions

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataList.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [UITableViewCell cellFromCodeWithTableView:tableView];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    BaseCellModel *model = self.dataList[indexPath.row];
    cell.textLabel.text = model.title;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    });
//    BaseCellModel *model = self.dataList[indexPath.row];
//    if(model.clazz != nil){
//        UIViewController *vc = [model.clazz new];
//        vc.hidesBottomBarWhenPushed = YES;
//        [self.navigationController pushViewController:vc animated:YES];
//    }
//    __block MyFlutterViewController *flutterViewController = [[MyFlutterViewController alloc] initWithProject:nil nibName:nil bundle:nil];
//    // 设置路由名字 跳转到不同的flutter界面
//    [flutterViewController setInitialRoute:@"myApp"];
//    WS(weakSelf)
//    // 要与main.dart中一致
//    NSString *channelName = @"com.pages.your/native_get";
//    FlutterMethodChannel *messageChannel = [FlutterMethodChannel methodChannelWithName:channelName binaryMessenger:flutterViewController];
//    [messageChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
//        // call.method 获取 flutter 给回到的方法名，要匹配到 channelName 对应的多个 发送方法名，一般需要判断区分
//        // call.arguments 获取到 flutter 给到的参数，（比如跳转到另一个页面所需要参数）
//        // result 是给flutter的回调， 该回调只能使用一次
//        NSLog(@"method=%@ \narguments = %@", call.method, call.arguments);
//
//        // method和WKWebView里面JS交互很像
//        // flutter点击事件执行后在iOS跳转TargetViewController
//        if ([call.method isEqualToString:@"iOSFlutter"]) {
//            TargetViewController *vc = [[TargetViewController alloc] init];
//            [weakSelf.navigationController pushViewController:vc animated:YES];
//            //[flutterViewController popRoute];
//        }
//        // flutter传参给iOS
//        if ([call.method isEqualToString:@"iOSFlutter1"]) {
//            NSDictionary *dic = call.arguments;
//            NSLog(@"arguments = %@", dic);
//            NSString *code = dic[@"code"];
//            NSArray *data = dic[@"data"];
//            NSLog(@"code = %@", code);
//            NSLog(@"data = %@",data);
//            NSLog(@"data 第一个元素%@",data[0]);
//            NSLog(@"data 第一个元素类型%@",[data[0] class]);
//        }
//        // iOS给iOS返回值
//        if ([call.method isEqualToString:@"iOSFlutter2"]) {
//            if (result) {
//                result(@"返回给flutter的内容");
//            }
//        }
//    }];
//    flutterViewController.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:flutterViewController animated:YES];
    
    MyFlutterViewController *vc = MyFlutterViewController.new;
    NSString *name = @"sample://firstPage";
    NSDictionary *params = @{};
    [vc setName:name params:params];
    //[self.navigationController presentViewController:vc animated:YES completion:nil];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark - getter && setter
- (NSMutableArray *)dataList
{
    if (_dataList == nil) {
        _dataList = [NSMutableArray array];
    }
    return _dataList;
}
@end
