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

+(NSString*)stringHTTPEncodedFromString:(NSString *)str;
-(NSString*)stringHTTPEncoded;
+(NSString*)stringFromDecimalTime:(float)time;
- (NSString *) md5;
- (BOOL)isEmpty;
- (BOOL)anyText;

+ (NSString *)stringFromInteger:(int)number;
+ (NSString *)stringFromFloat:(float)number withDecimalNumbers:(int)decimalNumbersCount;

- (int)stringHeightWithFont:(UIFont *)font width:(int)width;

@end
