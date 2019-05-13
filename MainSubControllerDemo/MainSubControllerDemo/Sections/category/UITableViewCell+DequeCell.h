//
//  UITableViewCell+DequeCell.h
//  LayerTest
//
//  Created by Lonelyflow on 2019/4/19.
//  Copyright © 2018年 Lonely traveller. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (DequeCell)
@property(nonatomic, strong, readonly) UITableView *parentTableView;
#pragma mark - 用xib实例化cell
+ (instancetype)cellHeaderFromXib;
/**
 从tableView获取重用的cell，如果没有可复用的从定义好的xib里创建一个，该方法有一下默认参数
 1、默认参数xibName:实例化化的xib名称,使用Cell的类的名称
 2、默认参数identifier：cell的重用ID，使用Cell的类的名称
 @param tableView 使用的tableView
 @return 重用或创建的一个cell
 */
+ (instancetype)cellFromXibWithTableView:(UITableView *)tableView;

/**
 从tableView获取重用的cell，如果没有可复用的从定义好的xib里创建一个，该方法有以下默认参数
 1、默认参数xibName:实例化化的xib名称,使用Cell的类的名称
 @param tableView 使用的tableView
 @param identifier cell的重用ID
 @return 重用或创建的一个cell
 */
+ (instancetype)cellFromXibWithTableView:(UITableView *)tableView identifer:(NSString *)identifier;

/**
 从tableView获取重用的cell，如果没有可复用的从定义好的xib里创建一个
 
 @param tableView 使用的tableView
 @param xibName 实例化化的xib名称
 @param identifier cell的重用ID
 @return 重用或创建的一个cell
 */
+ (instancetype)cellFromXibTableView:(UITableView *)tableView xibName:(NSString *)xibName identifer:(NSString *)identifier;
#pragma mark - 代码实例化一个cell
+ (instancetype)cellFromCodeWithTableView:(UITableView *)tableView;
+ (instancetype)cellFromCodeWithTableView:(UITableView *)tableView identifier:(NSString *)identifier;
@end

@interface UICollectionViewCell (DequeCell)
@property(nonatomic, strong, readonly) UICollectionView *parentCollectionView;
@end
