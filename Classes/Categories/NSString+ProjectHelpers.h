//
//  NSString+ProjectHelpres.h
//  ProjectHelpers
//
//  Created by Sergey P. on 12.07.12.
//  Copyright (c) 2015 Sergey P. All rights reserved.
//

@import Foundation;
@import UIKit;

#import <CommonCrypto/CommonDigest.h>

@interface NSString (ProjectHelpers)

+ (NSString *)stringHTTPEncodedFromString:(NSString *)str;
- (NSString *)stringHTTPEncoded;
+ (NSString *)stringFromDecimalTime:(CGFloat)time;
- (NSString *)md5;
- (BOOL)isEmpty;
- (BOOL)anyText;

+ (NSString *)stringFromInteger:(NSInteger)number;
+ (NSString *)stringFromFloat:(CGFloat)number withDecimalNumbers:(NSInteger)decimalNumbersCount;

- (CGFloat)heightWithFont:(UIFont *)font maxWidth:(CGFloat)maxWidth lineBreakMode:(NSLineBreakMode)lineBreakMode;
- (CGFloat)widthWithfont:(UIFont *)font maxHeight:(CGFloat)maxHeight lineBreakMode:(NSLineBreakMode)lineBreakMode;

@end
