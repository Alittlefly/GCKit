//
//  FSContainerController.h
//  Ready
//
//  Created by mac on 2018/7/19.
//  Copyright © 2018年 Fission. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GCSideControllerProtocol.h"
#import "GCKitFunctionHeader.h"

@interface GCContainerController : UIViewController

@property(nonatomic,assign)CGFloat maximumLeftWidth;

@property(nonatomic,assign)BOOL enableEdgePan;

- (instancetype)initWithCenterController:(UIViewController *)centerController leftController:(UIViewController<GCSideControllerProtocol> *)leftController;

- (void)openLeftSide;

- (void)closeLeftSide;


// temp
- (UITabBarController *)tabbarCenterController;

@end
