//
//  UIViewController+GCContainerController.h
//  Ready
//
//  Created by mac on 2018/7/19.
//  Copyright © 2018年 Fission. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GCContainerController.h"

@interface UIViewController (GCContainerController)
@property(nonatomic, strong, readonly) GCContainerController *gc_containerController;
@end
