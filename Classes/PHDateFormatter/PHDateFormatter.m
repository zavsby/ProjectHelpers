//
//  PHDateFormatter.m
//  ProjectHelpers
//
//  Created by Sergey on 01.08.15.
//  Copyright (c) 2015 Sergey P. All rights reserved.
//

#import "PHDateFormatter.h"

@interface PHDateFormatter ()

@property (nonatomic, strong) NSMutableDictionary *formattersCache;

@end

@implementation PHDateFormatter

#pragma mark - Singleton

+ (instancetype)sharedFormatter {
    static PHDateFormatter *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [self new];
    });
    return instance;
}

#pragma mark - Public methods

- (NSDateFormatter *)dateFormatterWithFormat:(NSString *)format {
    NSParameterAssert(format);
    
    NSDateFormatter *dateFormatter = self.formattersCache[format];
    if (dateFormatter == nil) {
        dateFormatter = [NSDateFormatter new];
        dateFormatter.dateFormat = format;
        
        [self.formattersCache setObject:dateFormatter forKey:format];
    }
    
    return dateFormatter;
}

- (void)clearCache {
    [self.formattersCache removeAllObjects];
}

#pragma mark - Lazy

- (NSMutableDictionary *)formattersCache {
    if (_formattersCache == nil) {
        _formattersCache = [NSMutableDictionary dictionary];
    }
    return _formattersCache;
}

@end
