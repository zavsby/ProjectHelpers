//
//  NSMutableDictionary+ProjectHelpers.m
//  ProjectHelpers
//
//  Created by Sergey P. on 12.07.12.
//  Copyright (c) 2015 Sergey P. All rights reserved.
//

#import "NSMutableDictionary+ProjectHelpers.h"

@implementation NSMutableDictionary (ProjectHelpers)

- (void)addObject:(id)value forKey:(NSString *)key
{
    if (key == nil)
    {
        return;
    }
    if (value != nil)
    {
        [self setObject:value forKey:key];
    }
}

@end
