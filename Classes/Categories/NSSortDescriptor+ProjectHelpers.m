//
//  NSSortDescriptor+ProjectHelpers.m
//  ProjectHelpers
//
//  Created by Sergey P. on 12.07.12.
//  Copyright (c) 2015 Sergey P. All rights reserved.
//

#import "NSSortDescriptor+ProjectHelpers.h"

@implementation NSSortDescriptor (ProjectHelpers)

+ (NSArray *)sortDescriptorsFromString:(NSString *)str {
    if (str == nil || [str isEqualToString:@""]) {
        return nil;
    }
    
    NSMutableArray *sortDescriptors = [NSMutableArray array];
    NSArray *fields = [str componentsSeparatedByString:@", "];
    
    NSArray *lastFieldComponents = [((NSString *)fields.lastObject) componentsSeparatedByString:@" "];
    BOOL isAscending = lastFieldComponents.count > 1 ? [self isAscendingString:lastFieldComponents[1]] : YES;
    
    for (NSString *sortField in fields) {
        NSArray *components = [sortField componentsSeparatedByString:@" "];
        [sortDescriptors addObject:[NSSortDescriptor sortDescriptorWithKey:components[0] ascending:components.count > 1 ? [self isAscendingString:components[1]] : isAscending]];
    }
    
    return sortDescriptors;
}

+ (BOOL)isAscendingString:(NSString *)str {
    static NSString *ascString = @"asc";
    static NSString *descString = @"desc";
    
    if ([str isEqualToString:ascString]) {
        return YES;
    }
    else if ([str isEqualToString:descString]) {
        return NO;
    }
    
    @throw [[NSException alloc] initWithName:@"Argument Exception" reason:@"Unknown sort param." userInfo:nil];
}

@end
