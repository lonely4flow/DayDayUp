//
//  MyFlutterRouter.m
//  HybridiOS
//
//  Created by loneylyflow on 15/05/2019.
//  Copyright © 2019 Lonely traveller. All rights reserved.
//

#import "MyFlutterRouter.h"
#import <UIKit/UIKit.h>

@interface MyFlutterRouter()
@property(nonatomic, strong) UINavigationController *navigationController;
@end

@implementation MyFlutterRouter
  
+ (instancetype)sharedRouter
{
    static MyFlutterRouter *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[MyFlutterRouter alloc] init];
    });
    return _instance;
}
- (void)openPage:(NSString *)name params:(NSDictionary *)params animated:(BOOL)animated completion:(void (^)(BOOL))completion
{
        if([params[@"present"] boolValue]){
            FLBFlutterViewContainer *vc = FLBFlutterViewContainer.new;
            [vc setName:name params:params];
            [self.navigationController presentViewController:vc animated:animated completion:^{}];
        }else{
            FLBFlutterViewContainer *vc = FLBFlutterViewContainer.new;
            [vc setName:name params:params];
            [self.navigationController pushViewController:vc animated:animated];
        }
    }
    
    
- (void)closePage:(NSString *)uid animated:(BOOL)animated params:(NSDictionary *)params completion:(void (^)(BOOL))completion
{
    FLBFlutterViewContainer *vc = (id)self.navigationController.presentedViewController;
    if([vc isKindOfClass:FLBFlutterViewContainer.class] && [vc.uniqueIDString isEqual: uid]){
        [vc dismissViewControllerAnimated:animated completion:^{}];
    }else{
        [self.navigationController popViewControllerAnimated:animated];
    }
}
- (UINavigationController *)navigationController
{
    UITabBarController *tabVC = (UITabBarController *)[UIApplication sharedApplication].delegate.window.rootViewController;
    if([tabVC isKindOfClass:[UITabBarController class]]){
        UINavigationController *nav = (UINavigationController *)tabVC.selectedViewController;
        if([nav isKindOfClass:[UINavigationController class]]){
            return nav;
        }else{
            return [[UINavigationController alloc] init];
        }
    }
    return [[UINavigationController alloc] init];
}
@end
