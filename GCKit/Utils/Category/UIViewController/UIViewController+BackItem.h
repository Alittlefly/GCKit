//
//  UIViewController+BackItem.h
//  Mrxs
//
//  Created by mac on 2019/4/2.
//  Copyright © 2019年 Fly. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
    在assets 中加入 名为“Nav_back” 的返回按钮即可，或者override createBackItem
 */

@interface UIViewController (BackItem)

/**
    override
 */
- (void)createbackItem;
@end

NS_ASSUME_NONNULL_END
