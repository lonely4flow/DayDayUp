//
//  UITableViewCell+DequeCell.m
//  LayerTest
//
//  Created by Lonelyflow on 2019/4/19.
//  Copyright © 2018年 Lonely traveller. All rights reserved.
//

#import "UITableViewCell+DequeCell.h"

@implementation UITableViewCell (DequeCell)
#pragma mark - 用xib实例化cell
+ (instancetype)cellHeaderFromXib
{
    NSString *className = NSStringFromClass(self);
    return [[[NSBundle mainBundle] loadNibNamed:className owner:nil options:nil] lastObject];
}
+ (instancetype)cellFromXibWithTableView:(UITableView *)tableView
{
    NSString *className = NSStringFromClass(self);
    return [self cellFromXibTableView:tableView xibName:className identifer:className];
}

+ (instancetype)cellFromXibWithTableView:(UITableView *)tableView identifer:(NSString *)identifier
{
    NSString *className = NSStringFromClass(self);
    return [self cellFromXibTableView:tableView xibName:className identifer:identifier];
}

+ (instancetype)cellFromXibTableView:(UITableView *)tableView xibName:(NSString *)xibName identifer:(NSString *)identifier
{
    id cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell == nil){
        NSString *xibPath =  [[NSBundle mainBundle] pathForResource:xibName ofType:@"nib"];
        if(xibPath == nil){
            cell = [self cellFromCodeWithTableView:tableView identifier:identifier];
        }else{
            cell = [[[NSBundle mainBundle] loadNibNamed:xibName owner:nil options:nil] lastObject];
        }
        return cell;

    }
    return cell;
}
+ (instancetype)cellFromCodeWithTableView:(UITableView *)tableView
{
    NSString *className = NSStringFromClass(self);
    id cell = [tableView dequeueReusableCellWithIdentifier:className];
    if(cell == nil){
        cell = [[NSClassFromString(className) alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:className];
    }
    return cell;
}
+ (instancetype)cellFromCodeWithTableView:(UITableView *)tableView identifier:(NSString *)identifier
{
    NSString *className = NSStringFromClass(self);
    id cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell == nil){
        cell = [[NSClassFromString(className) alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}
#pragma mark - 代码实例化一个cell

- (UITableView *)parentTableView
{
    UIView * view = self.superview;
    while(view != nil) {
        if([view isKindOfClass:[UITableView class]]) {
            return (UITableView*) view;
        }
        view = view.superview;
    }
    return nil;
}
@end



@implementation UICollectionViewCell (DequeCell)
- (UICollectionView *)parentCollectionView
{
    UIView * view = self.superview;
    while(view != nil) {
        if([view isKindOfClass:[UICollectionView class]]) {
            return (UICollectionView*) view;
        }
        view = view.superview;
    }
    return nil;
}
@end
