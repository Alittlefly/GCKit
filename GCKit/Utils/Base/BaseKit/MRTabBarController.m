//
//  MRTabBarController.m
//  Mrxs
//
//  Created by mac on 2019/3/28.
//  Copyright © 2019年 Fly. All rights reserved.
//

#import "MRTabBarController.h"

@interface MRTabBarController ()

@end

@implementation MRTabBarController
- (instancetype)init {
    if (self = [super init]) {
        [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:HexRGB_GC(0xAAAAAA),NSFontAttributeName:[UIFont systemFontOfSize:10]} forState:(UIControlStateNormal)];
        [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:HexRGB_GC(0x474747),NSFontAttributeName:[UIFont systemFontOfSize:10]} forState:(UIControlStateSelected)];
        
        [[UITabBar appearance] setBarTintColor:[UIColor whiteColor]];
        [[UITabBar appearance] setTranslucent:NO];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
