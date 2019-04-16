//
//  MRGradientView.h
//  Mrxs
//
//  Created by mac on 2019/3/29.
//  Copyright © 2019年 Fly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GCBaseView.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger,GCGradientViewDirection){
    GCGradientViewDirectionVertical,
    GCGradientViewDirectionHorizontal
};

@interface GCGradientView : GCBaseView
@property(nonatomic,strong)NSArray *colors;
@property(nonatomic,assign)GCGradientViewDirection direction;
@end

NS_ASSUME_NONNULL_END
