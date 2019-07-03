//
//  CWContentViewController.m
//  demo1
//
//  Created by dcw on 2019/6/26.
//  Copyright © 2019 ambow. All rights reserved.
//

#import "CWContentViewController.h"
#define CWColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define CWRandomColor CWColor(arc4random_uniform(255),arc4random_uniform(255),arc4random_uniform(255))

@interface CWContentViewController ()

@end

@implementation CWContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = CWRandomColor;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
