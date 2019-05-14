//
//  Consts.h
//  MainSubControllerDemo
//
//  Created by LonelyFlow on 13/05/2019.
//  Copyright © 2019 Lonely traveller. All rights reserved.
//

#ifndef Consts_h
#define Consts_h
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
#define SS(strongSelf) __strong __typeof(&*weakSelf)strongSelf = weakSelf;
#define KStatusBarHeight [UIApplication sharedApplication].statusBarFrame.size.height
#define kNavBarHeight [UINavigationBar appearance].frame.size.height
#define kNavgationHeight (KStatusBarHeight+kNavBarHeight)
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#endif /* Const_h */
