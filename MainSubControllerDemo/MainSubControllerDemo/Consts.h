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

#endif /* Const_h */
