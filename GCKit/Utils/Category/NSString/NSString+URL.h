//
//  NSString+URL.h
//  Ready
//
//  Created by mac on 2018/9/13.
//  Copyright © 2018年 Fission. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (URL)

+ (NSString *)addqueryItems:(NSDictionary *)dict Url:(NSString *)url Paths:(NSString *)path,...;

+ (NSString *)addQueryItemWithKey:(NSString *)key value:(NSString *)value Url:(NSString *)url;

+ (NSString *)addQueryItemWithDictionary:(NSDictionary *)dict Url:(NSString *)url;

- (NSString *)URLEncodedString;

- (NSString *)URLDecodedString;
@end
