//
//  GCKitFunctionHeader.h
//  GCKit
//
//  Created by mac on 2019/4/16.
//  Copyright © 2019 GaoChao. All rights reserved.
//

#ifndef GCKitFunctionHeader_h
#define GCKitFunctionHeader_h

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self

#define HexRGB_GC(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define HexRGBAlpha_GC(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]

#endif /* GCKitFunctionHeader_h */
