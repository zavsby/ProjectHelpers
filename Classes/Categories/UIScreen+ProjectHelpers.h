//
//  UIScreen+ProjectHelpers.h
//  ProjectHelpers
//
//  Created by Sergey P. on 12.07.12.
//  Copyright (c) 2015 Sergey P. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScreen (ProjectHelpers)

+ (int)screenHeight __deprecated_msg("Use +orientedScreenHeight instead.");
+ (int)screenWidth __deprecated_msg("Use +orientedScreenWidth instead.");

+ (CGSize)orientedScreenSize;
+ (CGFloat)orientedScreenHeight;
+ (CGFloat)orientedScreenWidth;

@end
