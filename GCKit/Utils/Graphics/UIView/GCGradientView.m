//
//  MRGradientView.m
//  Mrxs
//
//  Created by mac on 2019/3/29.
//  Copyright © 2019年 Fly. All rights reserved.
//

#import "GCGradientView.h"

@interface GCGradientView(){
    CAGradientLayer *_gradienLayer;
}
@end
@implementation GCGradientView
- (void)createSubviews {
    [super createSubviews];
    
    _gradienLayer = (CAGradientLayer *)self.layer;
    [_gradienLayer setStartPoint:CGPointMake(0, 0)];
    [_gradienLayer setEndPoint:CGPointMake(1, 0)];
}
- (void)setColors:(NSArray *)colors {
    _colors = colors;
    [_gradienLayer setColors:colors];
}
- (void)setDirection:(GCGradientViewDirection)direction {
    _direction = direction;
    
    if (direction == GCGradientViewDirectionVertical) {
        [_gradienLayer setStartPoint:CGPointMake(0, 0)];
        [_gradienLayer setEndPoint:CGPointMake(0, 1)];
    }else{
        [_gradienLayer setStartPoint:CGPointMake(0, 0)];
        [_gradienLayer setEndPoint:CGPointMake(1, 0)];
    }
}
+(Class)layerClass {
    return [CAGradientLayer class];
}
@end

