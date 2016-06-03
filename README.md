# LZSSegement
公司项目中用到segement分段选择控件,原生的控件无法满足需求,自己就写了一个简单的控件,可以修改边框颜色边框宽度,字体选中时的大小,以及选中时item的背景颜色.由于时间紧促,写的功能较少,遇到什么bug或者有什么功能无法满足的欢迎提出来.
#用法简介
用法很简单几句代码就ok了
在viewDidLoad里加如下代码  
  
     LZSSegementView *segment = [[LZSSegementView alloc] initWithItems:@[@"常规任务",@"直通车任务",@"活动任务"]];  
     //数组只能是字符串(功能缺陷以后会进行优化); 
      segment.selectTextColor = [UIColor whiteColor];//选中时title的颜色
     segment.segementItemSelectColor = kLoginBtnColor; //选中时item的颜色
     segment.selectedSegmentIndex = 0;    //默认选中的是第一个索引为0
     segment.borderColor = kLoginBtnColor; //边框颜色
     segment.delegate = self;      //设置代理
     self.navigationItem.titleView = segment;
  到此,然后在实现代理方法就ok了
###LZSSegementView会根据array中的字符串长度自动计算控件需要的长度
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
