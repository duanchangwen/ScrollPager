//
//  CWContentScrollView.h
//  demo1
//
//  Created by dcw on 2019/6/26.
//  Copyright © 2019 ambow. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CWContentScrollViewDelegate <NSObject>
- (void)scrollViewIsScrolling:(UIScrollView *)scrollView;
- (void)pageScrollToIndex:(NSInteger)index;
@end

@interface CWContentScrollView : UIScrollView
@property(nonatomic,weak) id<CWContentScrollViewDelegate> delegates;
- (void)setControllerArray:(NSMutableArray *)cvA;
- (void)scrollToIndex:(NSInteger)index;             //滑动到哪一个界面
@end

NS_ASSUME_NONNULL_END
