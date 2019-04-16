//
//  MRCornerView.m
//  Mrxs
//
//  Created by mac on 2019/4/1.
//  Copyright © 2019年 Fly. All rights reserved.
//

#import "GCCornerView.h"

@interface GCCornerView(){
    CAShapeLayer *_layer;
}
@end
@implementation GCCornerView
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self configLayer];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self createSubviews];
    }
    return self;
}
- (void)createSubviews {
    [super createSubviews];
    
    [self configLayer];
}

- (void)configLayer{
    _layer = (CAShapeLayer *)self.layer;
    _layer.fillColor = [UIColor clearColor].CGColor;
    _layer.strokeColor = UIColor.whiteColor.CGColor;
    _layer.lineCap = kCALineCapRound;
    _layer.lineWidth = 1.0;
    [self setBackgroundColor:[UIColor clearColor]];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _layer.path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:_mRadius?: CGRectGetHeight(self.bounds)/2.0].CGPath;
}
- (void)setFillColor:(UIColor *)fillColor {
    _fillColor = fillColor;
    _layer.fillColor = fillColor.CGColor;
}
- (void)setStokeColor:(UIColor *)stokeColor {
    _layer.strokeColor = stokeColor.CGColor;
}
+ (Class)layerClass {
    return [CAShapeLayer class];
}
@end
