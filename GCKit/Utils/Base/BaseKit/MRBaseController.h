//
//  MRBaseController.h
//  Mrxs
//
//  Created by mac on 2019/3/28.
//  Copyright © 2019年 Fly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+BackItem.h"
#import "GCKitFunctionHeader.h"

NS_ASSUME_NONNULL_BEGIN

@interface MRBaseController : UIViewController

- (void)createSubviews;
- (UIColor *)preferredTitleColor;
- (UIColor *)preferredNavbarColor;
@end

NS_ASSUME_NONNULL_END
