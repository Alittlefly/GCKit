//
//  MRNavigationController.m
//  Mrxs
//
//  Created by mac on 2019/3/28.
//  Copyright © 2019年 Fly. All rights reserved.
//

#import "MRNavigationController.h"

@interface MRNavigationController ()

@end

@implementation MRNavigationController
- (instancetype)init {
    if (self = [super init]) {
        [[UINavigationBar appearance] setTintColor:[UIColor clearColor]];
        [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
        [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:18]}];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationBar setTranslucent:NO];
    
    
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
