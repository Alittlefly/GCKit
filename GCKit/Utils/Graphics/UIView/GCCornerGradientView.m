//
//  GCCornerGradientView.m
//  GCKit
//
//  Created by mac on 2019/4/16.
//  Copyright © 2019 GaoChao. All rights reserved.
//

#import "GCCornerGradientView.h"

@implementation GCCornerGradientView{
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
- (instancetype)init {
    if(self = [super init]){
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
    [self.layer setMask:_maskShapLayer];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat corner = _mRadius?_mRadius/2.0:(CGRectGetHeight(self.bounds)/2.0);
    UIBezierPath *pathMask =   [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:_corner cornerRadii:CGSizeMake(corner, corner)];
    _maskShapLayer.path = pathMask.CGPath;
}


@end
