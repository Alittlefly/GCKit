//
//  MRCornerButton.h
//  Mrxs
//
//  Created by mac on 2019/4/8.
//  Copyright © 2019年 Fly. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MRCornerButton : UIButton
@property(nonatomic,assign)CGFloat mRadius;
@property(nonatomic,strong)UIColor *fillColor;
@property(nonatomic,strong)UIColor *strokeColor;

@end

NS_ASSUME_NONNULL_END
