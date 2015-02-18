//
//  ProjectHelpers
//
//  Created by Sergey P. on 12.07.12.
//  Copyright (c) 2015 Sergey P. All rights reserved.
//

@import UIKit;
@import Foundation;

@interface UIView (ProjectHelpers)

@property (nonatomic) float left;
@property (nonatomic) float top;
@property (nonatomic) float bottom;
@property (nonatomic) float right;
@property (nonatomic) float height;
@property (nonatomic) float width;

- (void)setFrameX:(CGFloat)x;
- (void)setFrameY:(CGFloat)y;
- (void)setFrameHeight:(CGFloat)height;
- (void)setFrameWidth:(CGFloat)width;
- (void)setFrameX:(CGFloat)x andY:(CGFloat)y;
- (void)setFrameHeight:(CGFloat)height andWidth:(CGFloat)width;
- (void)setTop:(CGFloat)top andHeight:(CGFloat)height;
- (void)setLeft:(CGFloat)left andWidth:(CGFloat)width;

- (UIImage *)screenImage;

@end
