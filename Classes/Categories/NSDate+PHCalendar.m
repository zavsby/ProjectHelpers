//
//  NSDate+PHCalendar.m
//  ProjectHelpers
//
//  Created by Sergey P. on 12.07.12.
//  Copyright (c) 2015 Sergey P. All rights reserved.
//

#import "NSDate+PHCalendar.h"

@implementation NSDate (PHCalendar)

- (NSDateComponents *)ph_dateComponents
{
    return [[NSCalendar currentCalendar] components:NSDayCalendarUnit|NSMonthCalendarUnit| NSYearCalendarUnit fromDate:self];
}

- (NSUInteger)ph_dayOfWeek
{
    return [[NSCalendar currentCalendar] ordinalityOfUnit:NSDayCalendarUnit inUnit:NSWeekCalendarUnit forDate:self];
}

- (NSUInteger)ph_numberOfDaysInMonth
{
    return [[NSCalendar currentCalendar] rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:self].length;
}

- (NSDate *)ph_dateForCurrentMonthFirstDay
{
    NSDate *date = nil;
    BOOL isOk = [[NSCalendar currentCalendar] rangeOfUnit:NSMonthCalendarUnit startDate:&date interval:nil forDate:self];
    if (!isOk)
    {
        NSLog(@"Error: cannot return first day of current month.");
        return nil;
    }
    else
    {
        return date;
    }
}

- (NSDate *)ph_dateForFollowingMonthFirstDay
{
    NSDateComponents *followingMonthComponents = [[NSDateComponents alloc] init];
    followingMonthComponents.month = 1;
    return [[[NSCalendar currentCalendar] dateByAddingComponents:followingMonthComponents toDate:self options:0] ph_dateForCurrentMonthFirstDay];
}

- (NSDate *)ph_dateForPreviousMonthFirstDay
{
    NSDateComponents *previousMonthComponents = [[NSDateComponents alloc] init];
    previousMonthComponents.month = -1;
    return [[[NSCalendar currentCalendar] dateByAddingComponents:previousMonthComponents toDate:self options:0] ph_dateForCurrentMonthFirstDay];
}

- (NSDate *)ph_dateForCurrentMonthLastDay
{
    NSInteger numberOfDaysInMonth = [self ph_numberOfDaysInMonth];
    NSDateComponents *dateComponents = [self ph_dateComponents];
    dateComponents.day = numberOfDaysInMonth;
    return [[NSCalendar currentCalendar] dateFromComponents:dateComponents];
}

@end
