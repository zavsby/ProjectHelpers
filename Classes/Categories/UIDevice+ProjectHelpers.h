//
//  UIDevice+ProjectHelpers.h
//  ProjectHelpers
//
//  Created by Sergey P. on 12.07.12.
//  Copyright (c) 2015 Sergey P. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (ProjectHelpers)

- (NSString *)getMacAddress __deprecated_msg("Using of this method is prohibited by Apple.");

+ (BOOL)isIpad;
+ (BOOL)isIPhone;

+ (BOOL)isIOS7;
+ (BOOL)isIOS8orAbove;
+ (BOOL)isIOS8 __deprecated_msg("Use isIOS8orAbove method instead.");

+ (BOOL)isLandscapeOrientation;
+ (BOOL)isPortraitOrientation;

+ (UIInterfaceOrientation)currentOrientation;

@end
