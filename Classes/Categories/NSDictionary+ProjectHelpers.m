//
//  NSDictionary+ProjectHelpers.m
//  ProjectHelpers
//
//  Created by Sergey on 29.07.15.
//  Copyright (c) 2015 Sergey Plotkin. All rights reserved.
//

#import "NSDictionary+ProjectHelpers.h"

@implementation NSDictionary (ProjectHelpers)

static NSNumberFormatter *defaultNumberFormatter;

- (NSString *)stringForKey:(NSString *)key {
    if (key != nil) {
        id value = [self objectForKey:key];
        if ([value isKindOfClass:[NSString class]]) {
            return value;
        }
    }
    
    return nil;
}

- (NSNumber *)numberForKey:(NSString *)key {
    if (key != nil) {
        id value = [self objectForKey:key];
        
        if ([value isKindOfClass:[NSNumber class]]) {
            return value;
        } else if ([value isKindOfClass:[NSString class]]) {
            if (defaultNumberFormatter == nil) {
                defaultNumberFormatter = [NSNumberFormatter new];
            }
            
            return [defaultNumberFormatter numberFromString:value];
        }
    }
    
    return nil;
}

- (BOOL)boolValueForKey:(NSString *)key {
    if (key != nil) {
        id value = [self objectForKey:key];
        
        if ([value isKindOfClass:[NSNumber class]]) {
            return [value boolValue];
        } else if ([value isKindOfClass:[NSString class]]) {
            if ([value isEqualToString:@"true"] || [value isEqualToString:@"1"]) {
                return YES;
            } else if ([value isEqualToString:@"false"] || [value isEqualToString:@"0"]) {
                return NO;
            }
        }
    }
    
    return NO;
}

- (NSDictionary *)dictionaryForKey:(NSString *)key {
    if (key != nil) {
        id value = [self objectForKey:key];
        
        if ([value isKindOfClass:[NSDictionary class]]) {
            return value;
        }
    }
    
    return nil;
}

- (NSArray *)arrayForKey:(NSString *)key {
    if (key != nil) {
        id value = [self objectForKey:key];
        
        if ([value isKindOfClass:[NSArray class]]) {
            return value;
        }
    }
    
    return nil;
}

- (id)nullableObjectForKey:(NSString *)key {
    if (key != nil) {
        id value = [self objectForKey:key];
        if (![value isEqual:[NSNull null]]) {
            return value;
        }
    }
    
    return nil;
}

@end
