//
//  UILabel+ProjectHelpers.h
//  ProjectHelpers
//
//  Created by Sergey P. on 12.07.12.
//  Copyright (c) 2015 Sergey P. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (ProjectHelpers)

- (void)setLabelFrameBehindLabel:(UILabel *)label withIndent:(NSInteger)indent __deprecated;
- (CGFloat)labelHeightForText:(NSString *)text __deprecated_msg("This method can return wrong value. Use NSString category instead.");

@end
