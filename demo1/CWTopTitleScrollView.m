//
//  CWTopTitleScrollView.m
//  demo1
//
//  Created by dcw on 2019/6/26.
//  Copyright © 2019 ambow. All rights reserved.
//

#import "CWTopTitleScrollView.h"

@interface CWTopTitleScrollView()
{
    NSInteger _contentW;
    NSInteger _itemwidth;
    NSMutableArray *_titleArray;
    
    UIView *_line;
    CGFloat _offset;
}
@end

@implementation CWTopTitleScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //默认值
        _contentW = self.frame.size.width;
        _itemwidth = 70;
    }
    return self;
}

- (void)setContentWidth:(NSInteger)width{
    _contentW = width;
    self.contentSize = CGSizeMake(width, self.frame.size.height);
}

- (void)setItemWidth:(NSInteger)width{
    _itemwidth = width;
}

- (void)setTitleArray:(NSMutableArray *)titles{
    _titleArray = titles;
}

- (void)createView{
    NSInteger itemW = _contentW/_titleArray.count;
    NSInteger margin = (itemW-_itemwidth)/2;
    for (NSInteger i=0; i<_titleArray.count; i++) {
        NSInteger x = (itemW *i)+margin;
        NSInteger y = 0;
        NSInteger w = _itemwidth;
        NSInteger h = self.frame.size.height;
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(x, y, w, h)];
        label.tag = i+100;
        label.text = _titleArray[i];
        label.textColor = [UIColor blackColor];
        label.font = [UIFont systemFontOfSize:13];
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
        label.userInteractionEnabled = YES;
        [label addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(itemClick:)]];
    }
    
    //添加下面的线条
    UIView *line = [[UIView alloc]init];
    [self addSubview:line];
    _line = line;
}

- (void)itemClick:(UITapGestureRecognizer *)ges{
    UILabel *clabel = (UILabel *)ges.view;
    NSInteger ltag = clabel.tag;
    if (_delegates) {
        [_delegates navItemClick:ltag-100];
    }
}

#pragma mark -- 设置一开始进来选中的item
- (void)defaultIndex:(NSInteger)index{
    //设置标题颜色
    UILabel *label = [self viewWithTag:index+100];
    label.textColor = [UIColor redColor];
    
    //设置下面线条颜色
    NSInteger itemW = _contentW/_titleArray.count;
    NSInteger margin = (itemW-_itemwidth)/2;
    _line.frame = CGRectMake((itemW *index)+margin, self.frame.size.height-2, _itemwidth, 2);
    _line.backgroundColor = [UIColor redColor];
}

//监听page的滑动
- (void)pageScrolling:(UIScrollView *)scrollview{
    NSInteger index = (NSInteger)((scrollview.contentOffset.x/(float)scrollview.frame.size.width)+0.5);
   
    for (NSInteger i=0; i<_titleArray.count; i++) {
        UILabel *label1 = [self viewWithTag:i+100];
        label1.textColor = [UIColor blackColor];
    }
    
    CGFloat offset = scrollview.contentOffset.x/(float)scrollview.frame.size.width;
    NSLog(@"=====%lf",offset);
    
    UILabel *label = [self viewWithTag:index+100];
    label.textColor = [UIColor redColor];
    
    //判断左滑动还是右滑动
    if (offset-_offset<=0) {
        [self scrollRectToVisible:CGRectMake(label.frame.origin.x-250, 0, label.frame.size.width, label.frame.size.height) animated:YES];
    }else{
        [self scrollRectToVisible:CGRectMake(label.frame.origin.x+250, 0, label.frame.size.width, label.frame.size.height) animated:YES];
    }
    _offset = offset;
    
    //监听后实时滑动线条位置
    NSInteger itemW = _contentW/_titleArray.count;
    NSInteger margin = (itemW-_itemwidth)/2;
    _line.frame = CGRectMake((itemW *offset)+margin, self.frame.size.height-2, _itemwidth, 2);
}

@end
