//
//  CWContentScrollView.m
//  demo1
//
//  Created by dcw on 2019/6/26.
//  Copyright © 2019 ambow. All rights reserved.
//

#import "CWContentScrollView.h"

@interface CWContentScrollView() <UIScrollViewDelegate>

@end

@implementation CWContentScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.pagingEnabled = YES;
        self.delegate = self;
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        [self setContentOffset:CGPointMake(0, 0)];
    }
    return self;
}

- (void)setControllerArray:(NSMutableArray *)cvA{
    self.contentSize = CGSizeMake(self.frame.size.width*cvA.count, self.frame.size.height);
    
    for (NSInteger i=0; i<cvA.count; i++) {
        UIViewController *con = cvA[i];
        con.view.frame = CGRectMake(i*self.frame.size.width, 0, self.frame.size.width, self.frame.size.height);
        [self addSubview:con.view];
    }
}

- (void)scrollToIndex:(NSInteger)index{
    NSInteger left_offset = index * self.frame.size.width;
    self.contentOffset = CGPointMake(left_offset, 0);
    
    [self scrollViewDidEndDecelerating:self];
}

#pragma mark ---- 滚动的时候
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (_delegates) {
        [_delegates scrollViewIsScrolling:scrollView];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger index = (NSInteger)((scrollView.contentOffset.x/(float)scrollView.frame.size.width)+0.5);
    if (_delegates) {
        [_delegates pageScrollToIndex:index];
    }
}

@end
