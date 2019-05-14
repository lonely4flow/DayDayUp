//
//  TestZJMainViewController.m
//  MainSubControllerDemo
//
//  Created by lonelyflow on 14/05/2019.
//  Copyright © 2019 Lonely traveller. All rights reserved.
//

#import "TestZJMainViewController.h"
#import "ZJScrollPageView.h"
#import "TestZJSubViewController.h"
//#import "ZJContentView+FDFullGessture.h"
@interface TestZJMainViewController () <ZJScrollPageViewDelegate>
@property (nonatomic,strong) NSMutableArray *childVcs;
@property (nonatomic, strong) ZJScrollPageView *scrollPageView;
@property(nonatomic, strong) NSArray *titles;
@end

@implementation TestZJMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self setupUI];
    [self setupLayout];
    self.titles = @[@{@"title":@"国际",@"code":@1},@{@"title":@"海洋",@"code":@2},@{@"title":@"太空",@"code":@3}];
    [self reshowSubVCs];
}
- (void)setupUI
{
    [self.view addSubview:self.scrollPageView];
}
- (void)setupLayout
{
    [self.scrollPageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.bottom.right.mas_equalTo(0);
    }];
}
- (void)reshowSubVCs
{
    for(UIViewController *vc in self.childVcs){
        [vc.view removeFromSuperview];
        [vc removeFromParentViewController];
    }
    [self.childVcs removeAllObjects];
    NSArray *list = [self.titles valueForKeyPath:@"title"];
    [self.scrollPageView reloadWithNewTitles:list];
    
}
#pragma mark - ZJScrollPageViewDelegate
- (NSInteger)numberOfChildViewControllers {
    return self.titles.count;
}
- (UIViewController<ZJScrollPageViewChildVcDelegate> *)childViewController:(UIViewController<ZJScrollPageViewChildVcDelegate> *)reuseViewController forIndex:(NSInteger)index
{
    if(index>=self.childVcs.count){
        for(NSInteger i=self.childVcs.count;i<=index;i++){
            id listVC = [TestZJSubViewController new];
            [self.childVcs addObject:listVC];
        }
        
    }
    return self.childVcs[index];
}
#pragma mark - getter && setter
- (ZJScrollPageView *)scrollPageView
{
    if (_scrollPageView == nil) {
        ZJSegmentStyle *style = [[ZJSegmentStyle alloc] init];
        //显示滚动条
        style.showLine = YES;
        style.contentViewBounces = NO;
        style.autoAdjustTitlesWidth = YES;
        style.scrollLineColor = [UIColor colorWithHexVal:0x088972];
        style.normalTitleColor = [UIColor colorWithHexVal:0x272727];
        style.selectedTitleColor = [UIColor colorWithHexVal:0x088972];
//        style.showSeperatorLine = YES;
//        style.seperatorLineColor = UIColorFromRGB(0x088972);
        // 颜色渐变
        style.gradualChangeTitleColor = YES;
        CGRect frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight-kNavgationHeight);
        //frame = CGRectZero;
        _scrollPageView = [[ZJScrollPageView alloc] initWithFrame:frame segmentStyle:style titles:nil parentViewController:self delegate:self];
    }
    return _scrollPageView;
}
- (NSMutableArray *)childVcs
{
    if (_childVcs == nil) {
        _childVcs = [NSMutableArray array];
    }
    return _childVcs;
}

@end
