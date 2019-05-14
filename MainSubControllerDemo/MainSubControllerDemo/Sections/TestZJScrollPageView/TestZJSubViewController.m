//
//  TestZJSubViewController.m
//  MainSubControllerDemo
//
//  Created by lonelyflow on 14/05/2019.
//  Copyright © 2019 Lonely traveller. All rights reserved.
//

#import "TestZJSubViewController.h"
@interface TestZJSubViewController()
@property(nonatomic, assign) BOOL hasShowedBefore;
@end
@implementation TestZJSubViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupUI];
    [self setupLayout];
}
- (void)setupUI
{
    //self.tableView.backgroundColor = [UIColor randomColor];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    [self.view addSubview:self.tableView];
}
- (void)setupLayout
{
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.mas_equalTo(0);
    }];
}
- (void)loadNewData
{
    WS(weakSelf)
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakSelf.tableView.mj_header endRefreshing];
    });
}
- (void)zj_viewWillAppearForIndex:(NSInteger)index
{
    if(!self.hasShowedBefore){
        self.hasShowedBefore = YES;
        [self.tableView.mj_header beginRefreshing];
    }
}
@end
