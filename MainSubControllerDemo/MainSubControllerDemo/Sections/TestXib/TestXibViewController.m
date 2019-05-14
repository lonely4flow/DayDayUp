//
//  TestXibViewController.m
//  MainSubControllerDemo
//
//  Created by LonelyFlow on 13/05/2019.
//  Copyright © 2019 Lonely traveller. All rights reserved.
//

#import "TestXibViewController.h"
#import "TestXibTwo.h"
#import "TestXibOne.h"
#import "TestXibThree.h"
@interface TestXibViewController ()
@property (weak, nonatomic) IBOutlet UITextView *threeArea;

@end

@implementation TestXibViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 是否让view从穿透半透明的导航栏
    //self.edgesForExtendedLayout = UIRectEdgeNone;
    NSLog(@">>> %@",NSStringFromCGRect(self.view.frame));
    TestXibOne *one = [[[NSBundle mainBundle] loadNibNamed:@"TestXibOne" owner:nil options:nil] lastObject];
    one.txtview.text = @"只设置class，不设置file's owner，outlets关联到class上 \r\none one one one";
    one.frame = CGRectMake(10, 50, 300, 100);
    one.backgroundColor = [UIColor lightTextColor];
    [self.view addSubview:one];
    
    TestXibTwo *two = [[[NSBundle mainBundle] loadNibNamed:@"TestXibTwo" owner:nil options:nil] lastObject];
    two.txtView.text = @"class和file's owner是同一个，outlets关联到class上 \r\ntwo two two two,";
    two.frame = CGRectMake(10, 260, 300, 100);
    two.backgroundColor = [UIColor lightTextColor];
    [self.view addSubview:two];
    

    TestXibThree *three = [[[NSBundle mainBundle] loadNibNamed:@"TestXibThree" owner:self options:nil] firstObject];
    self.threeArea.text = @"设置class，同时file's owner为controller ，outlets关联到file's owner上 \r\nthree three three three";
    three.frame = CGRectMake(10, 370, 300, 200);
    three.backgroundColor = [UIColor lightTextColor];
    [self.view addSubview:three];
}
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    NSLog(@"<<< %@",NSStringFromCGRect(self.view.frame));
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
