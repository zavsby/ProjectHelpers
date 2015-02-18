//
//  NSArray+ProjectHelpers.m
//  ProjectHelpers
//
//  Created by Sergey P. on 12.07.12.
//  Copyright (c) 2015 Sergey P. All rights reserved.
//

#import "NSArray+ProjectHelpers.h"

@implementation NSArray (ProjectHelpers)

- (NSArray *)sortedArray:(NSString *)sort
{
    return [self sortedArrayUsingDescriptors:[NSSortDescriptor sortDescriptorsFromString:sort]];
}

@end
