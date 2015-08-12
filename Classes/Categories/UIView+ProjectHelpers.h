//
//  ProjectHelpers
//
//  Created by Sergey P. on 12.07.12.
//  Copyright (c) 2015 Sergey P. All rights reserved.
//

@import UIKit;
@import Foundation;

@interface UIView (ProjectHelpers)

@property (nonatomic, assign) CGFloat left;
@property (nonatomic, assign) CGFloat top;
@property (nonatomic, assign) CGFloat bottom;
@property (nonatomic, assign) CGFloat right;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat width;

- (void)setFrameX:(CGFloat)x andY:(CGFloat)y;
- (void)setFrameHeight:(CGFloat)height andWidth:(CGFloat)width;
- (void)setTop:(CGFloat)top andHeight:(CGFloat)height;
- (void)setLeft:(CGFloat)left andWidth:(CGFloat)width;

- (UIImage *)screenImage;

/**
 *  Creates a view instance using XIB file with class name.
 */
+ (instancetype)loadFromNib;
/**
 *  Creates a view instance custom XIB file.
 */
+ (instancetype)loadFromCustomNib:(NSString *)nibName;

@end
