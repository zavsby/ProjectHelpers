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

+ (NSString*)stringHTTPEncodedFromString:(NSString *)str {
    return [str stringHTTPEncoded];
}

- (NSString *)stringHTTPEncoded {
    return (__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes( NULL,(CFStringRef)self,NULL,(CFStringRef)@"!Т\"();:@&=+$,/?%#[]% ",kCFStringEncodingISOLatin1);
}

+ (NSString *)stringFromDecimalTime:(CGFloat)time {
    int minutes = ((int)(time*60))%60;
    return [NSString stringWithFormat:@"%dh%dm",(int)time,minutes];
}

- (NSString *)md5 {
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

- (BOOL)isEmpty {
    return [[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] == 0;
}

- (BOOL)anyText {
    return ![self isEmpty];
}

+ (NSString *)stringFromInteger:(NSInteger)number {
    return [NSString stringWithFormat:@"%ld", (long)number];
}

+ (NSString *)stringFromFloat:(CGFloat)number withDecimalNumbers:(NSInteger)decimalNumbersCount {
    NSString *format = [NSString stringWithFormat:@"%%.%ldf", (long)decimalNumbersCount];
    return [NSString stringWithFormat:format, number];
}

- (CGFloat)heightWithFont:(UIFont *)font maxWidth:(CGFloat)maxWidth lineBreakMode:(NSLineBreakMode)lineBreakMode {
    if (!font || [self isEmpty]) {
        return 0;
    }
    
    if ([self rangeOfString:@"\n"].location != NSNotFound) {
        return [self heightWithFont:font maxWidth:maxWidth];
    }
    
    NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
    paragraphStyle.lineBreakMode = lineBreakMode;
    
    NSDictionary *attributes = @{
                                 NSFontAttributeName: font,
                                 NSParagraphStyleAttributeName: paragraphStyle
                                 };
    
    CGRect rect = [self boundingRectWithSize:CGSizeMake(maxWidth, CGFLOAT_MAX)
                                     options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                  attributes:attributes
                                     context:nil];
    
    return ceill(rect.size.height);
}

- (CGFloat)heightWithFont:(UIFont *)font maxWidth:(CGFloat)maxWidth {
    UITextView *textView = [UITextView new];
    [textView setFont:font];
    [textView setText:self];
    CGSize textSize = [textView sizeThatFits:CGSizeMake(maxWidth, FLT_MAX)];
    
    return textSize.height;
}

- (CGFloat)widthWithfont:(UIFont *)font maxHeight:(CGFloat)maxHeight lineBreakMode:(NSLineBreakMode)lineBreakMode {
    if (!font) {
        return 0;
    }
    
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineBreakMode = lineBreakMode;
    
    NSDictionary *attributes = @{
                                 NSFontAttributeName : font,
                                 NSParagraphStyleAttributeName: paragraph
                                 };
    
    CGRect rect = [self boundingRectWithSize:CGSizeMake (CGFLOAT_MAX, maxHeight)
                                     options:(NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin)
                                  attributes:attributes
                                     context:nil];
    return ceilf(rect.size.width);
}

@end
