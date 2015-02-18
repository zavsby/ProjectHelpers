//
//  UIScreen+ProjectHelpers.m
//  ProjectHelpers
//
//  Created by Sergey P. on 12.07.12.
//  Copyright (c) 2015 Sergey P. All rights reserved.
//

#import "UIScreen+ProjectHelpers.h"

@implementation UIScreen (ProjectHelpers)

+ (int)screenHeight
{
    return [[UIScreen mainScreen] bounds].size.height;
}

+ (int)screenWidth
{
    return [[UIScreen mainScreen] bounds].size.width;
}

@end
