//
//  UITabBar+Container.m
//  Ready
//
//  Created by mac on 2019/1/9.
//  Copyright © 2019年 Fission. All rights reserved.
//

#import "UITabBar+Container.h"
#import <objc/runtime.h>

@implementation UITabBar (Container)
- (UIView *)badgeContainer {
    UIView *badgeContainer = objc_getAssociatedObject(self, _cmd);
    if (!badgeContainer) {
        badgeContainer = [[UIView alloc] init];
        [badgeContainer setBackgroundColor:[UIColor clearColor]];
        [badgeContainer setUserInteractionEnabled:NO];
        objc_setAssociatedObject(self, _cmd, badgeContainer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return badgeContainer;
}
- (void)setBadgeContainer:(UIView *)badgeContainer {
    objc_setAssociatedObject(self, @selector(badgeContainer), badgeContainer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)otherContainer {
    UIView *otherContainer = objc_getAssociatedObject(self, _cmd);
    if (!otherContainer) {
        otherContainer = [[UIView alloc] init];
        [otherContainer setUserInteractionEnabled:NO];

        objc_setAssociatedObject(self, _cmd, otherContainer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return otherContainer;
}
- (void)setOtherContainer:(UIView *)otherContainer {
    objc_setAssociatedObject(self, @selector(otherContainer), otherContainer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (void)layoutContainers {
    
    [self addSubview:self.otherContainer];
    [self.otherContainer setFrame:self.bounds];
    
    [self addSubview:self.badgeContainer];
    [self.badgeContainer setFrame:self.bounds];
}
@end
