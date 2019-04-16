//
//  GCCornerGradientView.h
//  GCKit
//
//  Created by mac on 2019/4/16.
//  Copyright © 2019 GaoChao. All rights reserved.
//

#import "GCGradientView.h"

NS_ASSUME_NONNULL_BEGIN

@interface GCCornerGradientView : GCGradientView

@property(nonatomic,assign)CGFloat mRadius;
/**
 *  UIRectCornerAllCorners default
 */
@property(nonatomic,assign)UIRectCorner corner;
@end

NS_ASSUME_NONNULL_END
