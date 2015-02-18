//
//  UIDevice+ProjectHelpers.h
//  ProjectHelpers
//
//  Created by Sergey P. on 12.07.12.
//  Copyright (c) 2015 Sergey P. All rights reserved.
//

#import <UIKit/UIKit.h>
#include <sys/socket.h>
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>

@interface UIDevice (ProjectHelpers)

- (NSString *)getMacAddress;
+ (BOOL)isIpad;
+ (BOOL)isIPhone;

+ (BOOL)isIOS7;
+ (BOOL)isIOS8;

+ (BOOL)isLandscapeOrientation;
+ (BOOL)isPortraitOrientation;

+ (UIInterfaceOrientation)currentOrientation;

@end
