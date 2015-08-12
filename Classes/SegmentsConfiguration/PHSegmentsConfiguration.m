//
//  PHSegmentsConfiguration.m
//  Project Helpers
//
//  Created by Sergey Plotkin on 02/08/2015.
//  Copyright (c) 2015 Sergey P. All rights reserved.
//

#import "PHSegmentsConfiguration.h"

static NSString * const kSegmentsKey = @"segments";
static NSString * const kSegmentTitleKey = @"title";
static NSString * const kSegmentValueKey = @"value";

@interface PHSegmentsConfiguration ()

@property (nonatomic, strong) NSArray *segments;

@end

@implementation PHSegmentsConfiguration

#pragma mark - Init

+ (instancetype)configurationWithFile:(NSString *)fileName inDirectory:(NSString *)directoryName {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"plist" inDirectory:directoryName];
    NSDictionary *configurationDictionary = [NSDictionary dictionaryWithContentsOfFile:filePath];
    
    return [[self alloc] initWithDictionary:configurationDictionary];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (dictionary == nil) {
        return nil;
    }
    
    self = [super init];
    if (self) {
        _segments = dictionary[kSegmentsKey];
    }
    return self;
}

#pragma mark - Getters

- (NSArray *)localizedSegmentsTitles {
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:self.segments.count];
    
    [self.segments enumerateObjectsUsingBlock:^(NSDictionary *segment, NSUInteger idx, BOOL *stop) {
        NSString *value = NSLocalizedString(segment[kSegmentTitleKey], nil);
        [result addObject:value];
    }];
    
    return result;
}

- (NSUInteger)valueForSegmentAtIndex:(NSUInteger)index {
    if (index < self.segments.count) {
        return [self.segments[index][kSegmentValueKey] unsignedIntegerValue];
    }
    
    return 0;
}

- (NSString *)localizedTitleForValue:(NSUInteger)value {
    for (NSDictionary *segment in self.segments) {
        if ([segment[kSegmentValueKey] unsignedIntegerValue] == value) {
            return NSLocalizedString(segment[kSegmentTitleKey], nil);
        }
    }
    
    return nil;
}

- (NSUInteger)segmentIndexForValue:(NSUInteger)value {
    return [self.segments indexOfObjectPassingTest:^BOOL(NSDictionary *segment, NSUInteger idx, BOOL *stop) {
        return [segment[kSegmentValueKey] unsignedIntegerValue] == value;
    }];
}

@end
