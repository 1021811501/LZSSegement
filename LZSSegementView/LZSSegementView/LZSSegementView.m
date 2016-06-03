//
//  LZSSegementView.m
//  UisegementController
//
//  Created by 李志帅 on 16/6/3.
//  Copyright © 2016年 李志帅. All rights reserved.
//

#import "LZSSegementView.h"
#define kScreenWidth  [[UIScreen mainScreen] bounds].size.width
@implementation LZSSegementView
{
    float segementHeight;       //sement的高度
    float segementItemWidth;      //segmentItem的宽度
    NSString *longestItem;         //字符串长度最长的标题(array的元素)
    float textFontSize;         //字体的大小
    float colSpace;             //item之间的空隙
    NSArray *itemsArray;        //就是传进来的itemsArray;
}
-(id)initWithItems:(NSArray *)array{
    self = [super init];
    if (self) {
        segementHeight = 25;
        textFontSize = 12;
        colSpace = 1;
        itemsArray = [NSArray arrayWithArray:array];
        [self createSegement:array];
    }
    return self;
}
-(void)createSegement:(NSArray *)array{
    self.layer.cornerRadius = 8;
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.layer.borderWidth = 1;
    self.clipsToBounds = YES;
    segementItemWidth = [self calculateSegementItemWidthWith:array[[self findLongestItem:array]] andFontSize:textFontSize];
    self.frame = CGRectMake(50, 50, segementItemWidth *array.count + colSpace * (array.count-1), segementHeight);
    self.backgroundColor = [UIColor lightGrayColor];
    for (int i = 0; i <array.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        [btn setTitle:array[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor whiteColor]];
        btn.tag = i + 1;
        [btn addTarget:self action:@selector(segementSelect:) forControlEvents:UIControlEventTouchUpInside];
        btn.titleLabel.font = [UIFont systemFontOfSize:textFontSize];
        btn.frame = CGRectMake((segementItemWidth + colSpace)*i, 0, segementItemWidth, segementHeight);
        [self addSubview:btn];
    }
}
-(void)segementSelect:(UIButton *)btn{
    [btn setBackgroundColor:self.segementItemSelectColor];
    [btn setTitleColor:self.selectTextColor forState:UIControlStateNormal];
    for (int i = 0; i<itemsArray.count; i++) {
        UIButton *but = (UIButton *)[self viewWithTag:i + 1];
        if (btn.tag -1 != i) {
            [but setBackgroundColor:[UIColor whiteColor]];
            [but setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }
    }
    if ([self.delegate respondsToSelector:@selector(LZSSegmentDidSelectAtIndex:)] ) {
        [self.delegate LZSSegmentDidSelectAtIndex:btn.tag -1];
    }
}
-(void)setSelectedSegmentIndex:(int)selectedSegmentIndex{
    //set方法中不要用self.
    _selectedSegmentIndex = selectedSegmentIndex;
    UIButton *btn = (UIButton *)[self viewWithTag:self.selectedSegmentIndex +1];
    [self segementSelect:btn];
}
-(void)setBorderColor:(UIColor *)borderColor{
    _borderColor = borderColor;
    self.layer.borderColor = borderColor.CGColor;
    self.backgroundColor = borderColor;
}
//根据字数多少计算items的宽度
-(float)calculateSegementItemWidthWith:(NSString *)itemTitles andFontSize:(int)fontSize{
    CGSize size = [itemTitles boundingRectWithSize:CGSizeMake(kScreenWidth, segementHeight) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil].size;
    float width = size.width;
    return width + 11;
}
//找到数组中length最长的元素
-(int)findLongestItem:(NSArray *)array{
    NSUInteger j = 0;           //数组中字符串最大长度
    int index = 0;              //数组中最长字符串的索引
    for (int i = 0; i<array.count; i++) {
        if ([array[i] length]>j) {
            j = [array[i] length];
            index = i;
        }
    }
    return index;
}
@end
