//
//  FSCornerGradientButton.h
//  Ready
//
//  Created by mac on 2018/8/21.
//  Copyright © 2018年 Fission. All rights reserved.
//

#import "FSGradientButton.h"

@interface FSCornerGradientButton : FSGradientButton
@property(nonatomic,assign)CGFloat mRadius;
/**
 *  UIRectCornerAllCorners default
 */
@property(nonatomic,assign)UIRectCorner corner;
@end
