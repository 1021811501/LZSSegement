//
//  ViewController.m
//  LZSSegementView
//
//  Created by 李志帅 on 16/6/3.
//  Copyright © 2016年 李志帅. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    LZSSegementView *segment = [[LZSSegementView alloc] initWithItems:@[@"常规任务",@"直通车任务",@"活动任务",@"任务任务"]];
    segment.selectTextColor = [UIColor whiteColor];
    segment.segementItemSelectColor = [UIColor lightGrayColor];
    segment.selectedSegmentIndex = 0;
    segment.delegate = self;
    [self.view addSubview:segment];

    // Do any additional setup after loading the view, typically from a nib.
}
-(void)LZSSegmentDidSelectAtIndex:(NSInteger)selectedSegmentIndex{
    NSLog(@"%ld",(long)selectedSegmentIndex);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
