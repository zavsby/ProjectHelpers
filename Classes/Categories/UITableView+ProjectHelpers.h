//
//  UITableView+ProjectHelpers.h
//  ProjectHelpers
//
//  Created by Sergey P. on 12.07.12.
//  Copyright (c) 2015 Sergey P. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (ProjectHelpers)

- (NSIndexPath *)indexPathForRowContaining:(UIView *)view;

@end
