//
//  NSError+Helper.m
//  ProjectHelpers
//
//  Created by Sergey P. on 12.07.12.
//  Copyright (c) 2015 Sergey P. All rights reserved.
//

#import "NSError+Helper.h"

@implementation NSError (Helper)

+ (id)errorWithDomain:(NSString *)domain description:(NSString *)desc code:(NSInteger)c {
    if (desc) {
        return [NSError errorWithDomain:domain code:c userInfo:@{NSLocalizedDescriptionKey: desc}];
    } else {
        return [NSError errorWithDomain:domain code:c userInfo:nil];
    }
}

@end
