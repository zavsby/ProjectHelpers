//
//  UILabel+ProjectHelpers.h
//  ProjectHelpers
//
//  Created by Sergey P. on 12.07.12.
//  Copyright (c) 2015 Sergey P. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (ProjectHelpers)

- (void)setLabelFrameBehindLabel:(UILabel*)label withIndent:(int)indent;
- (float)labelHeightForText:(NSString *)text;

@end
