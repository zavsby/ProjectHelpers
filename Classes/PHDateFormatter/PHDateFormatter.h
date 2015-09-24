//
//  PHDateFormatter.h
//  ProjectHelpers
//
//  Created by Sergey on 01.08.15.
//  Copyright (c) 2015 Sergey P. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  Class caches date formatters for the specific formats.
 *  Singleton.
 */
@interface PHDateFormatter : NSObject

+ (instancetype)sharedFormatter;

- (NSDateFormatter *)dateFormatterWithFormat:(NSString *)format;
- (NSDateFormatter *)dateFormatterWithFormat:(NSString *)format withLocale:(NSLocale *)locale;
- (void)clearCache;

@end
