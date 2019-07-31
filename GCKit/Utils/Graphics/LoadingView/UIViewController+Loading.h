//
//  UIViewController+Loading.h
//  Lolly
//
//  Created by Charles on 2017/11/7.
//  Copyright © 2017年 Fission. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Loading)
- (BOOL)isLoading;
- (void)showLoading;
- (void)hideLoading;
@end
