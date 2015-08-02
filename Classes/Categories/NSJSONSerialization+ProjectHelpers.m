//
//  NSJSONSerialization+ProjectHelpers.m
//  ProjectHelpers
//
//  Created by Sergey P. on 12.07.12.
//  Copyright (c) 2015 Sergey P. All rights reserved.
//

#import "NSJSONSerialization+ProjectHelpers.h"

@implementation NSJSONSerialization (ProjectHelpers)

+ (id)JSONObjectWithString:(NSString *)string options:(NSJSONReadingOptions)opt error:(NSError *__autoreleasing *)error {
    return [self JSONObjectWithData:[string dataUsingEncoding:NSUTF8StringEncoding] options:opt error:error];
}

+ (NSString *)stringWithJSONObject:(id)obj options:(NSJSONWritingOptions)opt error:(NSError *__autoreleasing *)error {
    return [[NSString alloc] initWithData:[self dataWithJSONObject:obj options:opt error:error] encoding:NSUTF8StringEncoding];
}

@end
