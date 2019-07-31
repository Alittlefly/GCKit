//
//  MRSegmentTitleView.h
//  Mrxs-Logistics
//
//  Created by mac on 2019/4/3.
//  Copyright © 2019年 XiaoShi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GCKitFunctionHeader.h"

typedef enum : NSUInteger {
    MRIndicatorTypeDefault,//默认与按钮长度相同
    MRIndicatorTypeEqualTitle,//与文字长度相同
    MRIndicatorTypeCustom,//自定义文字边缘延伸宽度
    MRIndicatorTypeNone,
    MRIndicatorTypeOuter,//外界创建 固定大小和样式，拒底部
} MRIndicatorType;//指示器类型枚举

NS_ASSUME_NONNULL_BEGIN
@class MRSegmentTitleView;
@protocol MRSegmentTitleViewDelegate;
@interface MRSegmentTitleView : UIView
@property (nonatomic, weak) id<MRSegmentTitleViewDelegate>delegate;

/**
 标题文字间距，默认20
 */
@property (nonatomic, assign) CGFloat itemMargin;

/**
 当前选中标题索引，默认0
 */
@property (nonatomic, assign) NSInteger selectIndex;

/**
 标题字体大小，默认15
 */
@property (nonatomic, strong) UIFont *titleFont;

/**
 标题选中字体大小，默认15
 */
@property (nonatomic, strong) UIFont *titleSelectFont;

/**
 标题正常颜色，默认black
 */
@property (nonatomic, strong) UIColor *titleNormalColor;

/**
 标题选中颜色，默认red
 */
@property (nonatomic, strong) UIColor *titleSelectColor;

/**
 指示器颜色，默认与titleSelectColor一样,在MRIndicatorTypeNone下无效
 */
@property (nonatomic, strong) UIColor *indicatorColor;

/**
 在MRIndicatorTypeCustom时可自定义此属性，为指示器一端延伸长度，默认5
 */
@property (nonatomic, assign) CGFloat indicatorExtension;

/**
 对象方法创建MRSegmentTitleView
 
 @param frame frame
 @param titlesArr 标题数组
 @param delegate delegate
 @param incatorType 指示器类型
 @return MRSegmentTitleView
 */
- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titlesArr delegate:(id<MRSegmentTitleViewDelegate>)delegate indicatorType:(MRIndicatorType)incatorType;
@end

NS_ASSUME_NONNULL_END

@protocol MRSegmentTitleViewDelegate <NSObject>

@optional

/**
 切换标题
 
 @param titleView MRSegmentTitleView
 @param startIndex 切换前标题索引
 @param endIndex 切换后标题索引
 */
- (void)MRSegmentTitleView:(MRSegmentTitleView *_Nullable)titleView startIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex;

/**
 将要开始滑动
 
 @param titleView MRSegmentTitleView
 */
- (void)MRSegmentTitleViewWillBeginDragging:(MRSegmentTitleView *_Nullable)titleView;

/**
 将要停止滑动
 
 @param titleView MRSegmentTitleView
 */
- (void)MRSegmentTitleViewWillEndDragging:(MRSegmentTitleView *_Nullable)titleView;


- (UIView *_Nonnull)MRSegmentTitleViewWillCreateCustomindicator;

@end
