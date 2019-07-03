//
//  CWViewPager.m
//  demo1
//
//  Created by dcw on 2019/6/26.
//  Copyright © 2019 ambow. All rights reserved.
//

#import "CWViewPager.h"
#import "CWTopTitleScrollView.h"
#import "CWContentScrollView.h"

@interface CWViewPager()<CWContentScrollViewDelegate,CWTopTitleScrollViewDeleagte>
{
    NSMutableArray *_titleArray;
    NSMutableArray *_cvArray;
    
    CWTopTitleScrollView *_navs;
    CWContentScrollView *_content;
}
@end

@implementation CWViewPager

- (void)setTitleArray:(NSMutableArray *)titleArray controlerArray:(NSMutableArray *)cvArray{
    _titleArray = titleArray;
    _cvArray = cvArray;
    
    CWTopTitleScrollView *navs = [[CWTopTitleScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 40)];
    navs.delegates = self;
    NSInteger maxW = _titleArray.count*100;
    [navs setContentWidth:maxW<self.frame.size.width?self.frame.size.width:maxW];
    [navs setItemWidth:70];
    [navs setTitleArray:_titleArray];
    [navs createView];
    [navs defaultIndex:0];
    _navs = navs;
    [self addSubview:navs];
    
    CWContentScrollView *content = [[CWContentScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(navs.frame), self.frame.size.width, self.frame.size.height-navs.frame.size.height)];
    [content setControllerArray:_cvArray];
    content.delegates = self;
    _content = content;
    [self addSubview:content];
}

- (void)setDefaultIndex:(NSInteger)index{
    [_navs defaultIndex:index];
    [_content scrollToIndex:index];
}

#pragma mark -- CWContentScrollViewDelegate
- (void)scrollViewIsScrolling:(UIScrollView *)scrollView{
    [_navs pageScrolling:scrollView];
}

- (void)pageScrollToIndex:(NSInteger)index{
    if (_delegates) {
        [_delegates pageSelectIndex:index];
    }
}


#pragma mark -- CWTopTitleScrollViewDeleagte
- (void)navItemClick:(NSInteger)index{
    [_content scrollToIndex:index];
}


@end
