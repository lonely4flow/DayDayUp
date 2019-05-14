//
//  ZJContentView+FDFullGessture.m
//  MainSubControllerDemo
//
//  Created by lonelyflow on 14/05/2019.
//  Copyright © 2019 Lonely traveller. All rights reserved.
//

#import "ZJContentView+FDFullGessture.h"

@implementation UIScrollView (FDFullGessture)
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    if (self.contentOffset.x <= 0) {
        if ([otherGestureRecognizer.delegate isKindOfClass:NSClassFromString(@"_FDFullscreenPopGestureRecognizerDelegate")]) {
            return YES;
        }
    }
    return NO;
}
@end
