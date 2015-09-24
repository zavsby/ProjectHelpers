//
//  NSDate+DateFromComponents.h
//  ProjectHelpers
//
//  Created by Sergey P. on 12.07.12.
//  Copyright (c) 2015 Sergey P. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (ProjectHelpers)

/**
 *  Creates NSDate object from string with given format.
 *  Uses date formatters caching by PHDateFormatter.
 */
+ (NSDate *)dateFromString:(NSString *)dateString withFormat:(NSString *)format;
/**
 *  Creates NSDate object with given day, month and year.
 */
+ (NSDate *)dateWithDay:(NSInteger)day month:(NSInteger)month year:(NSInteger)year;

/**
 *  Returns string with given format from NSDate object.
 *  Uses date formatters caching by PHDateFormatter.
 */
- (NSString *)formattedDate:(NSString *)format;

- (NSComparisonResult)compareWithoutTimeWithDate:(NSDate *)date;
- (BOOL)isEqualWithoutTimeWithDate:(NSDate *)date;

+ (NSUInteger)daysBetweenDate:(NSDate *)date andDate:(NSDate *)anotherDate;

- (NSDate *)dateOfDayBeginning;

- (NSString *)formattedRelativeDate:(NSString *)format;
- (NSString *)formattedRelativeDateTime:(NSString *)format;
- (NSString *)formattedRelativeDateTime:(NSString *)format showTimeAgo:(BOOL)showTimeAgo;

- (NSDate *)remindBirthdayDateIn:(NSInteger)days atHour:(NSInteger)hour andMinute:(NSInteger)minute;

@end
