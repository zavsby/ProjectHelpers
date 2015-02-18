//
//  NSDate+DateFromComponents.h
//  ProjectHelpers
//
//  Created by Sergey P. on 12.07.12.
//  Copyright (c) 2015 Sergey P. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (ProjectHelpers)

+(NSDate*)dateWithDay:(NSInteger)day month:(NSInteger)month year:(NSInteger)year;
+(NSDate*)dateFromString:(NSString*)dateString withFormat:(NSString*)format;

-(NSString*)formattedDate:(NSString*)format;

- (NSComparisonResult)compareWithoutTimeWithDate:(NSDate *)date;
- (BOOL)isEqualWithoutTimeWithDate:(NSDate *)date;

+ (NSUInteger)daysBetweenDate:(NSDate *)date andDate:(NSDate *)anotherDate;

- (NSDate *)dateOfDayBeginning;
- (NSString *)formattedOMDate:(NSString *)format;
- (NSString *)formattedOMDateTime:(NSString *)format;
- (NSString *)formattedOMDateTime:(NSString *)format showTimeAgo:(BOOL)showTimeAgo;
- (NSDate *)remindBirthdayDateIn:(NSInteger)days atHour:(NSInteger)hour andMinute:(NSInteger)minute;

@end
