//
//  NSDictionary+ProjectHelpers.h
//  ProjectHelpers
//
//  Created by Sergey on 29.07.15.
//  Copyright (c) 2015 Sergey Plotkin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (ProjectHelpers)

- (NSString *)stringForKey:(NSString *)key;
- (NSNumber *)numberForKey:(NSString *)key;
- (id)nullableObjectForKey:(NSString *)key;

@end
