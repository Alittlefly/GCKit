//
//  UIViewController+Loading.m
//  Lolly
//
//  Created by Charles on 2017/11/7.
//  Copyright © 2017年 Fission. All rights reserved.
//

#import "UIViewController+Loading.h"
#import "FSLoadingController.h"
#import <objc/runtime.h>

@interface UIViewController()
@property(nonatomic,strong)FSLoadingController *loadingController;
@property(nonatomic,assign)BOOL loadingControllerShowed;
@end
@implementation UIViewController (Loading)
- (BOOL)loadingControllerShowed {
    NSNumber *boolNumber = objc_getAssociatedObject(self,_cmd);
    return [boolNumber boolValue];
}
- (FSLoadingController *)loadingController {
    return objc_getAssociatedObject(self,_cmd);
}
- (void)setLoadingControllerShowed:(BOOL)loadingControllerShowed {
    objc_setAssociatedObject(self, @selector(loadingControllerShowed), [NSNumber numberWithBool:loadingControllerShowed], OBJC_ASSOCIATION_RETAIN);
}
- (void)setLoadingController:(FSLoadingController *)loadingController {
    objc_setAssociatedObject(self, @selector(loadingController), loadingController, OBJC_ASSOCIATION_RETAIN);
}
- (void)showLoading {
//    if (!self.loadingControllerShowed) {
//        return;
//    }
    if (!self.loadingController) {
        FSLoadingController *loadingController = [[FSLoadingController alloc] init];
        [self setLoadingController:loadingController];
    }
    [self setLoadingControllerShowed:YES];
    [self presentViewController:self.loadingController animated:NO completion:nil];
}

- (void)hideLoading {
//    if (self.loadingControllerShowed) {
        [self.loadingController dismissViewControllerAnimated:NO completion:nil];
        [self setLoadingControllerShowed:NO];
//    }
}

- (BOOL)isLoading {
    return [self.presentedViewController isEqual:self.loadingController];
}

@end
