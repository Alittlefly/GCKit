//
//  UIView+Loading.h
//  Lolly
//
//  Created by Charles on 2017/11/7.
//  Copyright © 2017年 Fission. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (GCViewLoading)
- (BOOL)gc_isLoading;
- (void)gc_showLoading;
- (void)gc_hideLoading;
@end
