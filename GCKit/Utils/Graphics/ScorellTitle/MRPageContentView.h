//
//  MRPageContentView.h
//  Mrxs-Logistics
//
//  Created by mac on 2019/4/3.
//  Copyright © 2019年 XiaoShi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GCKitFunctionHeader.h"
#import <Masonry.h>

NS_ASSUME_NONNULL_BEGIN

@class MRPageContentView;

@protocol MRPageContentViewDelegate <NSObject>

@optional

/**
 FSPageContentView开始滑动
 
 @param contentView FSPageContentView
 */
- (void)MRContentViewWillBeginDragging:(MRPageContentView *)contentView;

/**
 FSPageContentView滑动调用
 
 @param contentView FSPageContentView
 @param startIndex 开始滑动页面索引
 @param endIndex 结束滑动页面索引
 @param progress 滑动进度
 */
- (void)MRContentViewDidScroll:(MRPageContentView *)contentView startIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex progress:(CGFloat)progress;

/**
 FSPageContentView结束滑动
 
 @param contentView FSPageContentView
 @param startIndex 开始滑动索引
 @param endIndex 结束滑动索引
 */
- (void)MRContenViewDidEndDecelerating:(MRPageContentView *)contentView startIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex;

/**
 scrollViewDidEndDragging
 
 @param contentView FSPageContentView
 */
- (void)MRContenViewDidEndDragging:(MRPageContentView *)contentView;

@end

@interface MRPageContentView : UIView


/**
 对象方法创建FSPageContentView
 
 @param frame frame
 @param childVCs 子VC数组
 @param parentVC 父视图VC
 @param delegate delegate
 @return FSPageContentView
 */
- (instancetype)initWithFrame:(CGRect)frame childVCs:(NSArray *)childVCs parentVC:(UIViewController *)parentVC delegate:(id<MRPageContentViewDelegate>)delegate;

@property (nonatomic, weak) id<MRPageContentViewDelegate>delegate;

/**
 设置contentView当前展示的页面索引，默认为0
 */
@property (nonatomic, assign) NSInteger contentViewCurrentIndex;

/**
 设置contentView能否左右滑动，默认YES
 */
@property (nonatomic, assign) BOOL contentViewCanScroll;
@end

NS_ASSUME_NONNULL_END
