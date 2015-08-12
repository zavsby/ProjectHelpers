//
//  PHSegmentsConfiguration.h
//  Project Helpers
//
//  Created by Sergey Plotkin on 02/08/2015.
//  Copyright (c) 2015 Sergey P. All rights reserved.
//

@import Foundation;

/**
 *  Segments configuration. Can be used for any segment(list)-style view items configuration.
 *  Configuration file structure:
 *   array of segments, each segment is dictionary with 'title' and 'value'.
 */
@interface PHSegmentsConfiguration : NSObject

+ (instancetype)configurationWithFile:(NSString *)fileName inDirectory:(NSString *)directoryName;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

/** Returns array of ordered localized segment titles. */
- (NSArray *)localizedSegmentsTitles;
/** Returns integer value for segment at index. */
- (NSUInteger)valueForSegmentAtIndex:(NSUInteger)index;

/** Returns localized title for given value. */
- (NSString *)localizedTitleForValue:(NSUInteger)value;
/** Returns index of segment with given value. */
- (NSUInteger)segmentIndexForValue:(NSUInteger)value;

@end
