//
//  FSGradientButton.m
//  Ready
//
//  Created by mac on 2018/8/15.
//  Copyright © 2018年 Fission. All rights reserved.
//

#import "FSGradientButton.h"
@interface FSGradientButton()
{
    CAGradientLayer *_gradienLayer;
}
@end
@implementation FSGradientButton
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        _gradienLayer = (CAGradientLayer *)self.layer;
        [_gradienLayer setStartPoint:CGPointMake(0, 0)];
        [_gradienLayer setEndPoint:CGPointMake(0, 1)];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _gradienLayer = (CAGradientLayer *)self.layer;
        [_gradienLayer setStartPoint:CGPointMake(0, 0)];
        [_gradienLayer setEndPoint:CGPointMake(0, 1)];
    }
    return self;
}
- (void)setColors:(NSArray *)colors {
    _colors = colors;
    [_gradienLayer setColors:colors];
}
- (void)setDiration:(FSLinerDiration)diration {
    if (diration == FSLinerDirationH) {
        [_gradienLayer setStartPoint:CGPointMake(0, 0)];
        [_gradienLayer setEndPoint:CGPointMake(1, 0)];
    }else{
        [_gradienLayer setStartPoint:CGPointMake(0, 0)];
        [_gradienLayer setEndPoint:CGPointMake(0, 1)];
    }
}
+(Class)layerClass {
    return [CAGradientLayer class];
}
@end
