//
//  UIViewController+ProjectHelpers.h
//  ProjectHelpers
//
//  Created by Sergey on 17.08.15.
//  Copyright (c) 2015 Sergey P. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (ProjectHelpers)

- (void)addChildViewController:(UIViewController *)vc onView:(UIView *)view;
- (void)removeChildViewController:(UIViewController *)vc;

@end
