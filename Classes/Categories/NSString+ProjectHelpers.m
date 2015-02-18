//
//  NSString+ProjectHelpres.m
//  ProjectHelpers
//
//  Created by Sergey P. on 12.07.12.
//  Copyright (c) 2015 Sergey P. All rights reserved.
//

#import "NSString+ProjectHelpers.h"
#import "UIDevice+ProjectHelpers.h"

@implementation NSString (ProjectHelpers)

+(NSString*)stringHTTPEncodedFromString:(NSString *)str
{
    return [str stringHTTPEncoded];
}

-(NSString*)stringHTTPEncoded
{
    return (__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes( NULL,(CFStringRef)self,NULL,(CFStringRef)@"!Т\"();:@&=+$,/?%#[]% ",kCFStringEncodingISOLatin1);
}

+(NSString*)stringFromDecimalTime:(float)time
{
    int minutes = ((int)(time*60))%60;
    return [NSString stringWithFormat:@"%dh%dm",(int)time,minutes];
}

- (NSString *) md5
{
	const char *cStr = [self UTF8String];
	unsigned char result[16];
	CC_MD5( cStr, (CC_LONG)strlen(cStr), result ); // This is the md5 call
	return [NSString stringWithFormat:
			@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
			result[0], result[1], result[2], result[3],
			result[4], result[5], result[6], result[7],
			result[8], result[9], result[10], result[11],
			result[12], result[13], result[14], result[15]
			];
}

- (BOOL)isEmpty
{
    return ([[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] == 0) ? YES : NO;
}

- (BOOL)anyText
{
    return ![self isEmpty];
}

+ (NSString *)stringFromInteger:(int)number
{
    return [NSString stringWithFormat:@"%d", number];
}

+ (NSString *)stringFromFloat:(float)number withDecimalNumbers:(int)decimalNumbersCount
{
    NSString *format = [NSString stringWithFormat:@"%%.%df", decimalNumbersCount];
    return [NSString stringWithFormat:format, number];
}

- (int)stringHeightWithFont:(UIFont *)font width:(int)width
{
    if ([self isEmpty])
    {
        return 0;
    }
    
    CGRect frame = CGRectIntegral([self boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                                                     options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading)
                                                  attributes:@{NSFontAttributeName:font}
                                                     context:nil]);
    return frame.size.height + 1;
}

@end
