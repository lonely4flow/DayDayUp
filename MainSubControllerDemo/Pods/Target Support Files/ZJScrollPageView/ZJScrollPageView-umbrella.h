#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "UIView+ZJFrame.h"
#import "UIViewController+ZJScrollPageController.h"
#import "ZJContentView.h"
#import "ZJScrollPageView.h"
#import "ZJScrollPageViewDelegate.h"
#import "ZJScrollSegmentView.h"
#import "ZJSegmentStyle.h"
#import "ZJTitleView.h"

FOUNDATION_EXPORT double ZJScrollPageViewVersionNumber;
FOUNDATION_EXPORT const unsigned char ZJScrollPageViewVersionString[];

