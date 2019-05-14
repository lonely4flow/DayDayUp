//
//  HomeViewController.m
//  MainSubControllerDemo
//
//  Created by LonelyFlow on 11/05/2019.
//  Copyright © 2019 Lonely traveller. All rights reserved.
//

#import "HomeViewController.h"
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
    [self.dataList addObject:[BaseCellModel modelWithTitle:@"Text Xib" clazz:NSClassFromString(@"TestXibViewController")]];
    [self.dataList addObject:[BaseCellModel modelWithTitle:@"TestZJScrollPageView" clazz:NSClassFromString(@"TestZJMainViewController")]];
}
- (UITableViewStyle)tableViewStyle
{
    return UITableViewStyleGrouped;
}
- (void)setupUI
{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    [self.view addSubview:self.tableView];
    
}
- (void)setupLayout
{
    UIView *v = [UIView new];
    v.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:v];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.bottom.right.mas_equalTo(0);
    }];
}
#pragma mark - actions
- (void)loadNewData
{
    WS(weakSelf)
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakSelf.tableView.mj_header endRefreshing];
    });
}
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
    BaseCellModel *model = self.dataList[indexPath.row];
    if(model.clazz != nil){
        UIViewController *vc = [model.clazz new];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
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
