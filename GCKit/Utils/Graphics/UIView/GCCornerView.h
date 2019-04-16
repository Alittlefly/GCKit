//
//  MRCornerView.h
//  Mrxs
//
//  Created by mac on 2019/4/1.
//  Copyright © 2019年 Fly. All rights reserved.
//

#import "GCBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface GCCornerView : GCBaseView
@property(nonatomic,assign)CGFloat mRadius;
@property(nonatomic,strong)UIColor *fillColor;
@property(nonatomic,strong)UIColor *stokeColor;
@end

NS_ASSUME_NONNULL_END
