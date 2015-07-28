//
//  NSDictionary+NULLDefender.m
//  ProjectHelpers
//
//  Created by Sergey P. on 12.07.12.
//  Copyright (c) 2015 Sergey P. All rights reserved.
//

#import "NSDictionary+NULLDefender.h"

@implementation NSDictionary (NULLDefender)

- (id)nullableValueForKey:(NSString *)key
{
    if ([[self valueForKey:key] isEqual:[NSNull null]])
    {
        return nil;
    }
    return [self valueForKey:key];
}

@end
