//
//  MRCornerButton.m
//  Mrxs
//
//  Created by mac on 2019/4/8.
//  Copyright © 2019年 Fly. All rights reserved.
//

#import "MRCornerButton.h"

@implementation MRCornerButton{
    CAShapeLayer *_layer;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _layer = (CAShapeLayer *)self.layer;
        [self configLayer];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        _layer = (CAShapeLayer *)self.layer;
        [self configLayer];
    }
    return self;
}
- (void)configLayer{
    _layer.fillColor = [UIColor clearColor].CGColor;
    _layer.lineCap = kCALineCapRound;
    _layer.lineWidth = 1.0;
    [self setBackgroundColor:[UIColor clearColor]];
}

- (void)setFillColor:(UIColor *)fillColor {
    _layer.fillColor = fillColor.CGColor;
}
- (void)setStrokeColor:(UIColor *)strokeColor {
    _layer.strokeColor = strokeColor.CGColor;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _layer.path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:_mRadius?:CGRectGetHeight(self.bounds)/2.0].CGPath;
}

+ (Class)layerClass {
    return [CAShapeLayer class];
}
@end
