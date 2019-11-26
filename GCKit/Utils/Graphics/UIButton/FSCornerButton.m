//
//  FSCornerButton.m
//  Mrxs-Logistics
//
//  Created by mac on 2019/4/3.
//  Copyright © 2019年 XiaoShi. All rights reserved.
//

#import "FSCornerButton.h"

@implementation FSCornerButton{
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
    [self.layer setMask:_maskShapLayer];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    UIBezierPath *pathMask = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:CGRectGetHeight(self.bounds)/2.0];
    _maskShapLayer.path = pathMask.CGPath;
}

@end
