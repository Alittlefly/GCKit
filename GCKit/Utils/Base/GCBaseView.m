//
//  MRBaseView.m
//  GCKit
//
//  Created by mac on 2019/3/29.
//  Copyright © 2019年 Fly. All rights reserved.
//

#import "GCBaseView.h"

@implementation GCBaseView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self createSubviews];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self createSubviews];
    }
    return self;
}

- (void)createSubviews {}

@end
