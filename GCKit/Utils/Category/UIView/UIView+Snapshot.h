//
//  UIView+Snapshot.h
//  GCKit
//
//  Created by mac on 2019/5/30.
//  Copyright © 2019 GaoChao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Snapshot)

+ (UIImage *)getKeyWindowSnapshot;

+ (UIImage *)getSnapshotFromKeyWindowAtFrame:(CGRect)frame;

- (UIImage *)getSnapshotAtFrame:(CGRect)frame;

@end

NS_ASSUME_NONNULL_END
