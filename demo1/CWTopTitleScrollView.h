//
//  CWTopTitleScrollView.h
//  demo1
//
//  Created by dcw on 2019/6/26.
//  Copyright © 2019 ambow. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@protocol CWTopTitleScrollViewDeleagte <NSObject>
- (void)navItemClick:(NSInteger)index;
@end

@interface CWTopTitleScrollView : UIScrollView

@property(nonatomic,weak) id<CWTopTitleScrollViewDeleagte> delegates;

//必须实现
- (void)setContentWidth:(NSInteger)width;
- (void)setItemWidth:(NSInteger)width;
- (void)setTitleArray:(NSMutableArray *)titles;
- (void)defaultIndex:(NSInteger)index;
- (void)pageScrolling:(UIScrollView *)scrollview;
- (void)createView;

@end

NS_ASSUME_NONNULL_END
