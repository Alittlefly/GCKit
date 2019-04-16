//
//  FSSideControllerProtocol.h
//  Ready
//
//  Created by mac on 2018/12/5.
//  Copyright © 2018年 Fission. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GCSideControllerProtocol <NSObject>
@optional
- (void)sideControllerWillOpen;
- (void)sideControllerDidOpen;
- (void)sideControllerWillClose;
- (void)sideControllerDidClose;

@end
