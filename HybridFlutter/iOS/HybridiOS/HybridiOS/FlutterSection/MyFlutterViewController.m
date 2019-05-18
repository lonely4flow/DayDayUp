//
//  MyFlutterViewController.m
//  HybridiOS
//
//  Created by loneylyflow on 15/05/2019.
//  Copyright © 2019 Lonely traveller. All rights reserved.
//

#import "MyFlutterViewController.h"
#import "UINavigationController+FDFullscreenPopGesture.h"
@interface MyFlutterViewController ()

@end

@implementation MyFlutterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.fd_prefersNavigationBarHidden = YES;
    
}
@end
