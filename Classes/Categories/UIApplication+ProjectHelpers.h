//
//  UIApplication+ProjectHelpers.h
//  ProjectHelpers
//
//  Created by Sergey P. on 12.07.12.
//  Copyright (c) 2015 Sergey P. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (ProjectHelpers)

+ (NSString *)supportDirectory;
+ (NSString *)cachesDirectory;
+ (NSString *)documentsDirectory;

@end
