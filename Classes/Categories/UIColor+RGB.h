//
//  UIColor+RGB.h
//  ProjectHelpers
//
//  Created by Sergey P. on 12.07.12.
//  Copyright (c) 2015 Sergey P. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (RGB)

+ (UIColor *)colorRGBWithRed:(NSInteger)red green:(NSInteger)green blue:(NSUInteger)blue alpha:(CGFloat)alpha;
+ (UIColor *)colorWithHexString:(NSString *)hex;

@end
