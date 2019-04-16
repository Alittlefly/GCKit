//
//  NSString+URL.m
//  Ready
//
//  Created by mac on 2018/9/13.
//  Copyright © 2018年 Fission. All rights reserved.
//

#import "NSString+URL.h"

@implementation NSString (URL)
+ (NSString *)addqueryItems:(NSDictionary *)dict Url:(NSString *)url Paths:(NSString *)path, ... {
    
    url = [NSString addQueryItemWithDictionary:dict Url:url];
    if (!url) {
        return nil;
    }
    
    url = [url gc_url].absoluteString;
    
    NSURLComponents *components = [NSURLComponents componentsWithString:url];
    if (!components.scheme) {
        return nil;
    }
    
    //
    NSURL *URL = components.URL;
    va_list paths;
    va_start(paths, path);
    if (path) {
        URL = [components.URL URLByAppendingPathComponent:path isDirectory:YES];
    }
    va_end(paths);
    return URL.absoluteString;
    
}
+ (NSString *)addQueryItemWithKey:(NSString *)key value:(NSString *)value Url:(NSString *)url{
    if (!url) {
        return nil;
    }
    
    url = [url gc_url].absoluteString;
    NSURLComponents *components = [NSURLComponents componentsWithString:url];
    if (!components.scheme) {
        return nil;
    }
    
    NSArray *quertItems = components.queryItems;
    NSMutableArray *queries = [NSMutableArray array];
    [queries addObjectsFromArray:quertItems?:@[]];
    
    NSString *trimKey = [key stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet];
    NSString *trimValue = [value stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet];
    if (trimKey != nil && trimKey.length != 0) {
        NSURLQueryItem *qitem = [NSURLQueryItem queryItemWithName:trimKey value:trimValue];
        [queries addObject:qitem];
    }
    components.queryItems = queries;
    return components.URL.absoluteString;
}
+ (NSString *)addQueryItemWithDictionary:(NSDictionary *)dict Url:(NSString *)url {
    if (!dict || !url) {
        return url;
    }
    
    url = [url gc_url].absoluteString;
    NSURLComponents *components = [NSURLComponents componentsWithString:url];
    if (!components.scheme) {
        return nil;
    }
    
    NSArray *quertItems = components.queryItems;
    NSMutableArray *queries = [NSMutableArray array];
    [queries addObjectsFromArray:quertItems?:@[]];
    
    NSArray *keys = [dict allKeys];
    for (id key in keys) {
        NSString *keyStr = [NSString stringWithFormat:@"%@",key];
        NSString *valueStr = [NSString stringWithFormat:@"%@",[dict valueForKey:keyStr]];
        NSURLQueryItem *qitem = [NSURLQueryItem queryItemWithName:keyStr value:valueStr];
        [queries addObject:qitem];
    }
    components.queryItems = queries;
    return components.URL.absoluteString;
}

/**
 *  URLEncode
 */
- (NSString *)URLEncodedString
{
    // CharactersToBeEscaped = @":/?&=;+!@#$()~',*";
    // CharactersToLeaveUnescaped = @"[].";
    
    NSString *unencodedString = self;
    NSString *encodedString = (NSString *)
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                              (CFStringRef)unencodedString,
                                                              NULL,
                                                              (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                              kCFStringEncodingUTF8));
    
    return encodedString;
}

/**
 *  URLDecode
 */
-(NSString *)URLDecodedString
{
    //NSString *decodedString = [encodedString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding ];
    
    NSString *encodedString = self;
    NSString *decodedString  = (__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL,
                                                                                                                     (__bridge CFStringRef)encodedString,
                                                                                                                     CFSTR(""),
                                                                                                                     CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
    return decodedString;
}

- (NSURL *)gc_url
{
    //    [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"!$&'()*+,-./:;=?@_~%#[]"]];
#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wdeprecated-declarations"
    return [NSURL URLWithString:(NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)self, (CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]", NULL,kCFStringEncodingUTF8))];
#pragma clang diagnostic pop
}

@end
