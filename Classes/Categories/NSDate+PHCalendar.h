//
//  NSDate+PHCalendar.h
//  ProjectHelpers
//
//  Created by Sergey P. on 12.07.12.
//  Copyright (c) 2015 Sergey P. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDate+ProjectHelpers.h"

@interface NSDate (PHCalendar)

- (NSDateComponents *)ph_dateComponents;
- (NSUInteger)ph_numberOfDaysInMonth;
// Returns day of week (from 1 to 7)
- (NSUInteger)ph_dayOfWeek;

- (NSDate *)ph_dateForPreviousMonthFirstDay;
- (NSDate *)ph_dateForFollowingMonthFirstDay;
- (NSDate *)ph_dateForCurrentMonthFirstDay;

- (NSDate *)ph_dateForCurrentMonthLastDay;


@end
