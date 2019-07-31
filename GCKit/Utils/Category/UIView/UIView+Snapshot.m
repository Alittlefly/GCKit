//
//  UIView+Snapshot.m
//  GCKit
//
//  Created by mac on 2019/5/30.
//  Copyright © 2019 GaoChao. All rights reserved.
//

#import "UIView+Snapshot.h"

@implementation UIView (Snapshot)

+ (UIImage *)getKeyWindowSnapshot
{
    UIWindow *screenWindow = [[UIApplication sharedApplication] keyWindow];
    return [screenWindow getSnapshotAtFrame:screenWindow.bounds];
}

+ (UIImage *)getSnapshotFromKeyWindowAtFrame:(CGRect)frame
{
    UIWindow *screenWindow = [[UIApplication sharedApplication] keyWindow];
    return [screenWindow getSnapshotAtFrame:frame];
}

- (UIImage *)getSnapshotAtFrame:(CGRect)frame
{
    if (CGRectEqualToRect(CGRectZero, self.bounds)) {
        return nil;
    }
    // 1、先根据 view，生成 整个 view 的截图
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, YES, 0);  //NO，YES 控制是否透明
    if ([self respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)]) {
        [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:NO];
    } else {
        [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    }
    UIImage *wholeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    // 如果 frame 和 bounds 一样，只要返回 wholeImage 就好。
    if (CGRectEqualToRect(frame, self.bounds)) {
        return wholeImage;
    }
    
    // 2、根据 view 的图片。生成指定位置大小的图片。
    CGFloat screenScale = [[UIScreen mainScreen] scale];
    CGRect imageToExtractFrame = CGRectApplyAffineTransform(frame, CGAffineTransformMakeScale(screenScale, screenScale));
    CGImageRef imageRef = CGImageCreateWithImageInRect([wholeImage CGImage], imageToExtractFrame);
    
    wholeImage = nil;
    
    UIImage *image = [UIImage imageWithCGImage:imageRef
                                         scale:screenScale
                                   orientation:UIImageOrientationUp];
    CGImageRelease(imageRef);
    return image;
}
@end
