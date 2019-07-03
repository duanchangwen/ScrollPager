//
//  ViewController.m
//  demo1
//
//  Created by dcw on 2019/6/26.
//  Copyright © 2019 ambow. All rights reserved.
//

#import "ViewController.h"
#import "CWViewPager.h"
#import "CWContentViewController.h"

@interface ViewController ()<CWViewPagerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self createView];
}

- (void)createView{
    NSMutableArray *titlea = [NSMutableArray array];
    NSMutableArray *cona = [NSMutableArray array];
    for (NSInteger i=0; i<7; i++) {
        [titlea addObject:[NSString stringWithFormat:@"标题%ld",i]];
        [cona addObject:[[CWContentViewController alloc] init]];
    }
    
    CWViewPager *pager = [[CWViewPager alloc] initWithFrame:CGRectMake(0, 144, self.view.frame.size.width, self.view.frame.size.height-344)];
    pager.delegates = self;
    [pager setTitleArray:titlea controlerArray:cona];
    [self.view addSubview:pager];
    [pager setDefaultIndex:1];
}

#pragma mark -- CWViewPagerDelegate
- (void)pageSelectIndex:(NSInteger)index{
    NSLog(@"====%ld",index);
}

@end
