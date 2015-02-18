//
//  UIApplication+ProjectHelpers.m
//  ProjectHelpers
//
//  Created by Sergey P. on 12.07.12.
//  Copyright (c) 2015 Sergey P. All rights reserved.
//

#import "UIApplication+ProjectHelpers.h"

@implementation UIApplication (ProjectHelpers)

- (NSString *)documentsDirectory
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    return basePath;
}

+ (NSString *)cachesDirectory
{
    return NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
}

+ (NSString *)supportDirectory
{
    return NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES).firstObject;
}

+ (int)screenHeight
{
    return (int)[[UIScreen mainScreen] bounds].size.height;
}

+ (int)screenWidth
{
    return (int)[[UIScreen mainScreen] bounds].size.width;
}

+ (int)realScreenWidth
{
    return UIInterfaceOrientationIsPortrait([[self sharedApplication] statusBarOrientation]) ? (int)[[UIScreen mainScreen] bounds].size.width : (int)[[UIScreen mainScreen] bounds].size.height;
}

+ (int)realScreenHeight
{
    return UIInterfaceOrientationIsPortrait([[self sharedApplication] statusBarOrientation]) ? (int)[[UIScreen mainScreen] bounds].size.height : (int)[[UIScreen mainScreen] bounds].size.width;
}

+ (BOOL)is4InchDevice
{
    return ([self screenHeight] > 480) ? YES : NO;
}

+ (BOOL)is35InchDevice
{
    return ([self screenHeight] == 480) ? YES : NO;
}

@end
