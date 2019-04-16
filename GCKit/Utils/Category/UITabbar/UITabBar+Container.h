//
//  UITabBar+Container.h
//  Ready
//
//  Created by mac on 2019/1/9.
//  Copyright © 2019年 Fission. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITabBar (Container)
/**
  放置badge的层
 */
@property(nonatomic,strong)UIView *badgeContainer;
/**
  放在badgeView 下方的层
 */
@property(nonatomic,strong)UIView *otherContainer;

- (void)layoutContainers;

@end

NS_ASSUME_NONNULL_END
