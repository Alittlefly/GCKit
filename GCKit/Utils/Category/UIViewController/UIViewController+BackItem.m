//
//  UIViewController+BackItem.m
//  Mrxs
//
//  Created by mac on 2019/4/2.
//  Copyright © 2019年 Fly. All rights reserved.
//

#import "UIViewController+BackItem.h"
#import <Objc/runtime.h>

@implementation UIViewController (BackItem)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method o_sel = class_getInstanceMethod(self, @selector(viewDidLoad));
        Method s_sel = class_getInstanceMethod(self, @selector(s_viewDidload));
        method_exchangeImplementations(o_sel, s_sel);
    });
}
- (void)s_viewDidload {
    
    [self createbackItem];
    
    [self s_viewDidload];
}

- (void)createbackItem {
    // 有导航的情况下处理
    if (self.navigationController) {
        UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
        backItem.title = @"";
        //主要是以下两个图片设置
        self.navigationController.navigationBar.backIndicatorImage = [[UIImage imageNamed:@"Nav_back"] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
        self.navigationController.navigationBar.backIndicatorTransitionMaskImage = [[UIImage imageNamed:@"Nav_back"] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
        self.navigationItem.backBarButtonItem = backItem;
    }
}
@end
