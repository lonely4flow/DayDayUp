//
//  MyFlutterRouter.h
//  HybridiOS
//
//  Created by loneylyflow on 15/05/2019.
//  Copyright © 2019 Lonely traveller. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <flutter_boost/FlutterBoost.h>
@interface MyFlutterRouter : NSObject <FLBPlatform>
@property(nonatomic, weak) FlutterViewController *flutterViewController;
+ (instancetype)sharedRouter;

/**
 原生调用flutter

 @param name 定义号的名字
 @param params 参数
 */
- (void)callFluterWithName:(NSString *)name params:(id)params;
@end

