//
//  LZSSegementView.h
//  UisegementController
//
//  Created by 李志帅 on 16/6/3.
//  Copyright © 2016年 李志帅. All rights reserved.
//
//
#import <UIKit/UIKit.h>

@protocol LZSSegmentDelegate <NSObject>

@optional
-(void)LZSSegmentDidSelectAtIndex:(NSInteger)selectedSegmentIndex;

@end

@interface LZSSegementView : UIView
@property(nonatomic, weak)id <LZSSegmentDelegate>delegate;
@property(nonatomic, strong)UIColor *selectTextColor;     //选中时的字体颜色
@property(nonatomic, strong)UIColor *segementItemSelectColor;//选中时的背景颜色
@property(nonatomic, strong)UIColor *borderColor;           //segment的边框颜色
@property(nonatomic, assign)int selectedSegmentIndex;      //选中的index 默认是0
-(id)initWithItems:(NSArray *)array;         //array必须是字符串
@end
