//
//  UILabel+ProjectHelpers.m
//  ProjectHelpers
//
//  Created by Sergey P. on 12.07.12.
//  Copyright (c) 2015 Sergey P. All rights reserved.
//

#import "UILabel+ProjectHelpers.h"

@implementation UILabel (ProjectHelpers)

- (void)setLabelFrameBehindLabel:(UILabel *)label withIndent:(NSInteger)indent {
    NSInteger width = [label.text sizeWithAttributes:@{NSFontAttributeName: label.font}].width;
    CGRect labelFrame = self.frame;
    labelFrame.origin.x = label.frame.origin.x + width + indent;
    self.frame = labelFrame;
}

- (CGFloat)labelHeightForText:(NSString *)text {
    CGSize constraint = CGSizeMake(self.frame.size.width, 10000);
    return ceil([text boundingRectWithSize:constraint options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: self.font} context:nil].size.height);
}

@end
