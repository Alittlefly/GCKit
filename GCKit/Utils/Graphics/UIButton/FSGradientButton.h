//
//  FSGradientButton.h
//  Ready
//
//  Created by mac on 2018/8/15.
//  Copyright © 2018年 Fission. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,FSLinerDiration){
    FSLinerDirationV,
    FSLinerDirationH
};
@interface FSGradientButton : UIButton
@property(nonatomic,strong)NSArray *colors;
@property(nonatomic,assign)FSLinerDiration diration;
@end
