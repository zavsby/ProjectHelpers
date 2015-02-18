//
//  ProjectHelpers
//
//  Created by Sergey P. on 12.07.12.
//  Copyright (c) 2015 Sergey P. All rights reserved.
//

#import "UIView+ProjectHelpers.h"

@implementation UIView (ProjectHelpers)

- (void)setFrameX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setFrameY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (void)setFrameHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (void)setFrameWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setFrameX:(CGFloat)x andY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin = CGPointMake(x, y);
    self.frame = frame;
}

- (void)setFrameHeight:(CGFloat)height andWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size = CGSizeMake(width, height);
    self.frame = frame;
}

- (void)setTop:(CGFloat)top andHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.origin.y = top;
    frame.size.height = height;
    self.frame = frame;
}

- (void)setLeft:(CGFloat)left andWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.origin.x = left;
    frame.size.width = width;
    self.frame = frame;
}

#pragma mark - Additional properties

- (void)setHeight:(float)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (void)setWidth:(float)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setTop:(float)top
{
    CGRect frame = self.frame;
    frame.origin.y = top;
    self.frame = frame;
}

- (void)setLeft:(float)left
{
    CGRect frame = self.frame;
    frame.origin.x = left;
    self.frame = frame;
}

- (void)setBottom:(float)bottom
{
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (void)setRight:(float)right
{
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (float)height
{
    return self.frame.size.height;
}

- (float)width
{
    return self.frame.size.width;
}

- (float)top
{
    return self.frame.origin.y;
}

- (float)left
{
    return self.frame.origin.x;
}

- (float)right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (float)bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (UIImage *)screenImage
{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0);
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:YES];
    UIImage *copied = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return copied;
}

@end
