//
//  ViewController.m
//  SWBaseKit
//
//  Created by ttxc on 2019/5/29.
//  Copyright © 2019 http://www.jianshu.com/u/84d0142cbec9. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UILabel*label = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    label.text = @"12345";
    label.font = GetFont(30.0);
    [self.view addSubview:label];
    
    UserDefaultsSetObject(@"111", @"key");
    SWLog(@"1234 -%@",UserDefaultsObjectForKey(@"key"));
}


@end
