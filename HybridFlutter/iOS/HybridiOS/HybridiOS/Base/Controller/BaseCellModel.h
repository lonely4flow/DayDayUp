//
//  BaseCellModel.h
//  MainSubControllerDemo
//
//  Created by lonelyflow on 14/05/2019.
//  Copyright © 2019 Lonely traveller. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseCellModel : NSObject
@property(nonatomic, copy) NSString *title;
@property(nonatomic, strong) Class clazz;
@property(nonatomic, copy) NSString *flutterPageName;
// 是否跳转到flutter页面
@property(nonatomic, assign) BOOL isFlutterPage;

+ (instancetype)modelWithTitle:(NSString *)title clazz:(Class)clazz;
+ (instancetype)modelWithTitle:(NSString *)title flutterPageName:(NSString *)pageName;
@end

