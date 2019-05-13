//
//  BaseTableViewController.h
//  MainSubControllerDemo
//
//  Created by LonelyFlow on 11/05/2019.
//  Copyright © 2019 Lonely traveller. All rights reserved.
//

#import "BaseViewController.h"
#import <MJRefresh/MJRefresh.h>

@interface BaseTableViewController : BaseViewController <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property(nonatomic, assign) UITableViewStyle tableViewStyle;
@end

