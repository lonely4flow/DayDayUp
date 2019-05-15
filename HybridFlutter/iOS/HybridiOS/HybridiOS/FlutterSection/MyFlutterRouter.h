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
+ (instancetype)sharedRouter;
@end

