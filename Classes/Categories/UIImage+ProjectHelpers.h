//
//  UIImage+ProjectHelpers.h
//  ProjectHelpers
//
//  Created by Sergey P. on 12.07.12.
//  Copyright (c) 2015 Sergey P. All rights reserved.
//

@import UIKit;

@interface UIImage (ProjectHelpers)

- (UIImage *)roundCornerImage:(NSInteger)cornerSize borderSize:(NSInteger)borderSize;
+ (UIImage*)getMaskForRect:(CGRect)rect withRadiusTopLeft:(CGFloat)tl topRight:(CGFloat)tr bottomLeft:(CGFloat)bl bottomRight:(CGFloat)br;

- (BOOL)isHorizontalOrientation;

@end
