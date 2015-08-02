//
//  NSMutableDictionary+ProjectHelpers.h
//  ProjectHelpers
//
//  Created by Sergey P. on 12.07.12.
//  Copyright (c) 2015 Sergey P. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (ProjectHelpers)

/*
 *  Safely adds object for given key. Object will not be added if key of value is nil.
 */
- (void)addObject:(id)value forKey:(NSString *)key;

@end
