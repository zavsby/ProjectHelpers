//
//  NSJSONSerialization+ProjectHelpers.h
//  ProjectHelpers
//
//  Created by Sergey P. on 12.07.12.
//  Copyright (c) 2015 Sergey P. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSJSONSerialization (ProjectHelpers)

+ (id)JSONObjectWithString:(NSString *)string options:(NSJSONReadingOptions)opt error:(NSError *__autoreleasing *)error;
+ (NSString *)stringWithJSONObject:(id)obj options:(NSJSONWritingOptions)opt error:(NSError *__autoreleasing *)error;

@end
