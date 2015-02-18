//
//  UITableView+ProjectHelpers.m
//  ProjectHelpers
//
//  Created by Sergey P. on 12.07.12.
//  Copyright (c) 2015 Sergey P. All rights reserved.
//

#import "UITableView+ProjectHelpers.h"

@implementation UITableView (ProjectHelpers)

-(NSIndexPath*)indexPathForRowContaining:(UIView *)view
{
    CGPoint correctedPoint = [view convertPoint:view.bounds.origin toView:self]; 
    return [self indexPathForRowAtPoint:correctedPoint];
}

@end
