//
//  FSCornerGradientButton.m
//  Ready
//
//  Created by mac on 2018/8/21.
//  Copyright © 2018年 Fission. All rights reserved.
//

#import "FSCornerGradientButton.h"

@implementation FSCornerGradientButton{
    CAShapeLayer *_maskShapLayer;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self configMask];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self configMask];
    }
    return self;
}
- (void)configMask {
    _maskShapLayer = [CAShapeLayer layer];
    _maskShapLayer.fillMode = kCAFillModeForwards;
    _maskShapLayer.fillColor =  [[UIColor redColor] CGColor];
    _maskShapLayer.strokeColor  = [[UIColor blueColor] CGColor];
    _maskShapLayer.lineCap = kCALineCapRound;
    _maskShapLayer.lineWidth = 1.0;
    _maskShapLayer.strokeEnd = 0;
    _maskShapLayer.fillRule = kCAFillRuleEvenOdd;
    _corner = UIRectCornerAllCorners;
    [self.layer setMask:_maskShapLayer];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat corner = _mRadius?_mRadius/2.0:(CGRectGetHeight(self.bounds)/2.0);
    UIBezierPath *pathMask =   [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:_corner cornerRadii:CGSizeMake(corner, corner)];
    _maskShapLayer.path = pathMask.CGPath;
}

@end
