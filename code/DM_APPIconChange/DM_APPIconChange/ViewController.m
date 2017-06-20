//
//  ViewController.m
//  DM_APPIconChange
//
//  Created by vyw杨伟(金融) on 2017/6/15.
//  Copyright © 2017年 brook. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray<NSString *> *weathers;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.weathers = @[@"fine", @"cloudy", @"sprinkles", @"heavyrain", @"snow", @""];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"查询今天的天气并更换响应图标" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button setFrame:CGRectMake(20, 200, self.view.bounds.size.width - 40, 30)];
    
    [button addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}

- (void)btnAction:(UIButton *)sender
{
    NSString *weather = self.weathers[arc4random() % self.weathers.count];
    [self setAppIconWithName:weather];
}

- (void)setAppIconWithName:(NSString *)iconName
{
    if (![[UIApplication sharedApplication] supportsAlternateIcons]) {
        return;
    }
    
    if ([iconName isEqualToString:@""]) {
        iconName = nil;
    }
    
    [[UIApplication sharedApplication] setAlternateIconName:iconName completionHandler:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"更换app图标发生错误了 ： %@",error);
        }
    }];
}

@end
