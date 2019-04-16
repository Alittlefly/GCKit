//
//  UIViewController+GCContainerController.m
//  Ready
//
//  Created by mac on 2018/7/19.
//  Copyright © 2018年 Fission. All rights reserved.
//

#import "UIViewController+GCContainerController.h"

@implementation UIViewController (GCContainerController)
- (GCContainerController *)gc_containerController {
    UIViewController *parentViewController = self.parentViewController;
    while (parentViewController != nil) {
        if([parentViewController isKindOfClass:[GCContainerController class]]){
            return (GCContainerController *)parentViewController;
        }
        parentViewController = parentViewController.parentViewController;
    }
    return nil;
}
@end
