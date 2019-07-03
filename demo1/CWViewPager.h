//
//  CWViewPager.h
//  demo1
//
//  Created by dcw on 2019/6/26.
//  Copyright © 2019 ambow. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CWViewPagerDelegate <NSObject>
- (void)pageSelectIndex:(NSInteger)index;
@end

@interface CWViewPager : UIView
@property(nonatomic,weak) id<CWViewPagerDelegate> delegates;

- (void)setDefaultIndex:(NSInteger)index;
- (void)setTitleArray:(NSMutableArray *)titleArray controlerArray:(NSMutableArray *)cvArray;
@end

NS_ASSUME_NONNULL_END
