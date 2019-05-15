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

+ (instancetype)modelWithTitle:(NSString *)title clazz:(Class)clazz;
@end

