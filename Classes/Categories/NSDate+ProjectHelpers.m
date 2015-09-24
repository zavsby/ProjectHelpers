//
//  NSDate+DateFromComponents.m
//  ProjectHelpers
//
//  Created by Sergey P. on 12.07.12.
//  Copyright (c) 2015 Sergey P. All rights reserved.
//

#import "NSDate+ProjectHelpers.h"
#import "PHDateFormatter.h"

static const NSInteger kDaysInAWeek = 7;

@implementation NSDate (ProjectHelpers)

+ (NSDate *)dateWithDay:(NSInteger)day month:(NSInteger)month year:(NSInteger)year {
    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.day = day;
    components.month = month;
    components.year = year;
    return [[NSCalendar currentCalendar] dateFromComponents:components];
}

- (NSString *)formattedDate:(NSString *)format {
    if (format.length > 0) {
        NSDateFormatter *dateFormatter = [[PHDateFormatter sharedFormatter] dateFormatterWithFormat:format];
        return [dateFormatter stringFromDate:self];
    }
    return nil;
}

+ (NSDate *)dateFromString:(NSString *)dateString withFormat:(NSString *)format {
    if (format.length > 0 && dateString.length > 0) {
        NSDateFormatter *dateFormatter = [[PHDateFormatter sharedFormatter] dateFormatterWithFormat:format];
        return [dateFormatter dateFromString:dateString];
    }
    return nil;
}

- (NSComparisonResult)compareWithoutTimeWithDate:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *selfComponents = [calendar components:NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit fromDate:self];
    NSDateComponents *otherComponents = [calendar components:NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit fromDate:date];
    
    return [[calendar dateFromComponents:selfComponents] compare:[calendar dateFromComponents:otherComponents]];
}

- (BOOL)isEqualWithoutTimeWithDate:(NSDate *)date {
    if (date == nil) {
        return NO;
    }
        
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *selfComponents = [calendar components:NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit fromDate:self];
    NSDateComponents *otherComponents = [calendar components:NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit fromDate:date];
    
    return selfComponents.day == otherComponents.day && selfComponents.month == otherComponents.month && selfComponents.year == otherComponents.year;
}

+ (NSUInteger)daysBetweenDate:(NSDate *)date andDate:(NSDate *)anotherDate {
    NSDate *fromDate;
    NSDate *toDate;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    [calendar rangeOfUnit:NSDayCalendarUnit startDate:&fromDate
                 interval:NULL forDate:date];
    [calendar rangeOfUnit:NSDayCalendarUnit startDate:&toDate
                 interval:NULL forDate:anotherDate];
    
    NSDateComponents *difference = [calendar components:NSDayCalendarUnit
                                               fromDate:fromDate toDate:toDate options:0];
    
    return abs((int)[difference day]);
}

- (NSDate *)remindBirthdayDateIn:(NSInteger)days atHour:(NSInteger)hour andMinute:(NSInteger)minute {
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDate* birthdayDate = [self dateOfDayBeginning];
    NSTimeInterval interval = [birthdayDate timeIntervalSince1970] - days * 86400;
    NSDate* remindDate = [NSDate dateWithTimeIntervalSince1970:interval];
    NSDateComponents* dateComponents = [calendar components:NSDayCalendarUnit|NSMonthCalendarUnit|NSYearCalendarUnit fromDate:remindDate];
    dateComponents.hour = hour;
    dateComponents.minute = minute;
    dateComponents.second = 0;
    return [calendar dateFromComponents:dateComponents];
}

- (NSDate *)dateOfDayBeginning {
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* components = [calendar components:(NSDayCalendarUnit|NSMonthCalendarUnit|NSYearCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit|NSSecondCalendarUnit) fromDate:self];
    components.hour = 0;
    components.minute = 0;
    components.second = 0;
    return [calendar dateFromComponents:components];
}

- (NSString *)formattedRelativeDateTime:(NSString *)format showTimeAgo:(BOOL)showTimeAgo {
    NSDate *dateNow = [NSDate date];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSCalendarUnit calendarUnits = NSSecondCalendarUnit|NSMinuteCalendarUnit|NSHourCalendarUnit|NSDayCalendarUnit|NSMonthCalendarUnit|NSYearCalendarUnit;
    NSDateComponents *nowComponents = [calendar components:calendarUnits fromDate:dateNow];
    NSDateComponents *selfComponents = [calendar components:calendarUnits fromDate:self];
    
    NSDateFormatter *timeFormatter = [[PHDateFormatter sharedFormatter] dateFormatterWithFormat:@"HH:mm"];
    
    NSInteger dayDifference = nowComponents.day - selfComponents.day;
    NSInteger monthDifference = nowComponents.month - selfComponents.month;
    NSInteger yearDifference = nowComponents.year - selfComponents.year;
    
    if (monthDifference == 0 && yearDifference == 0 && dayDifference <= kDaysInAWeek) {
        switch (dayDifference) {
            case 0:
                if (showTimeAgo) {
                    NSInteger hourDifference = nowComponents.hour - selfComponents.hour;
                    NSInteger minuteDifference = nowComponents.minute - selfComponents.minute;
                    NSInteger secondsDifference = nowComponents.second - selfComponents.second;
                    if (hourDifference > 0) {
                        NSString *hourLabel = hourDifference > 1 ? NSLocalizedString(@"hours", nil) : NSLocalizedString(@"hour", nil);
                        return [NSString stringWithFormat:NSLocalizedString(@"%d %@", nil), hourDifference, hourLabel];
                    }
                    if (minuteDifference > 0) {
                        NSString *minuteLabel = minuteDifference > 1 ? NSLocalizedString(@"minutes", nil) : NSLocalizedString(@"minute", nil);
                        return [NSString stringWithFormat:NSLocalizedString(@"%d %@", nil), minuteDifference, minuteLabel];
                    }
                    if (secondsDifference > 0) {
                        NSString *secondLabel = secondsDifference > 1 ? NSLocalizedString(@"seconds", nil) : NSLocalizedString(@"second", nil);
                        return [NSString stringWithFormat:NSLocalizedString(@"%d %@", nil), secondsDifference, secondLabel];
                    } else {
                        return NSLocalizedString(@"just now", nil);
                    }
                } else {
                    return [NSString stringWithFormat:NSLocalizedString(@"Today at %@", nil), [timeFormatter stringFromDate:self]];
                }
            case 1:
                return [NSString stringWithFormat:NSLocalizedString(@"Yesterday at %@", nil), [timeFormatter stringFromDate:self]];
            case 2:
                return [NSString stringWithFormat:NSLocalizedString(@"2 days ago at %@", nil), [timeFormatter stringFromDate:self]];
            case 3:
                return [NSString stringWithFormat:NSLocalizedString(@"3 days ago at %@", nil), [timeFormatter stringFromDate:self]];
            case 4:
                return [NSString stringWithFormat:NSLocalizedString(@"4 days ago at %@", nil), [timeFormatter stringFromDate:self]];
            case 5:
                return [NSString stringWithFormat:NSLocalizedString(@"5 days ago at %@", nil), [timeFormatter stringFromDate:self]];
            case 6:
                return [NSString stringWithFormat:NSLocalizedString(@"6 days ago at %@", nil), [timeFormatter stringFromDate:self]];
            case 7:
                return [NSString stringWithFormat:NSLocalizedString(@"Week ago at %@", nil), [timeFormatter stringFromDate:self]];
            default:
                return nil;
        }
    } else {
        NSDateFormatter *formatter = [[PHDateFormatter sharedFormatter] dateFormatterWithFormat:format];
        return [formatter stringFromDate:self];
    }
}

- (NSString *)formattedRelativeDateTime:(NSString *)format {
    return [self formattedRelativeDateTime:format showTimeAgo:NO];
}

- (NSString *)formattedRelativeDate:(NSString *)format {
    NSDate *dateNow = [NSDate date];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSDateComponents *nowComponents = [calendar components:NSDayCalendarUnit|NSMonthCalendarUnit|NSYearCalendarUnit fromDate:dateNow];
    NSDateComponents *selfComponents = [calendar components:NSDayCalendarUnit|NSMonthCalendarUnit|NSYearCalendarUnit fromDate:self];;
    NSDateFormatter *timeFormatter = [[PHDateFormatter sharedFormatter] dateFormatterWithFormat:@"HH:mm"];
    NSInteger dayDifference = nowComponents.day - selfComponents.day;
    NSInteger monthDifference = nowComponents.month - selfComponents.month;
    NSInteger yearDifference = nowComponents.year - selfComponents.year;
    
    if (monthDifference == 0 && yearDifference == 0 && dayDifference < 8) {
        if (dayDifference == 0) {
            return [timeFormatter stringFromDate:self];
        }
        
        switch (dayDifference) {
            case 1:
                return NSLocalizedString(@"Yesterday", @"Yesterday");
            case 2:
                return NSLocalizedString(@"2 days ago", @"2 days ago");
            case 3:
                return NSLocalizedString(@"3 days ago", @"3 days ago");
            case 4:
                return NSLocalizedString(@"4 days ago", @"4 days ago");
            case 5:
                return NSLocalizedString(@"5 days ago", @"5 days ago");
            case 6:
                return NSLocalizedString(@"6 days ago", @"6 days ago");
            case 7:
                return NSLocalizedString(@"Week ago", @"Week ago");
            default:
                return nil;
        }
    } else {
        NSDateFormatter *formatter = [[PHDateFormatter sharedFormatter] dateFormatterWithFormat:format];
        return [formatter stringFromDate:self];
    }
}

@end
