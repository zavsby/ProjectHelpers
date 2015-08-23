//
//  UIViewController+ProjectHelpers.m
//  ProjectHelpers
//
//  Created by Sergey on 17.08.15.
//  Copyright (c) 2015 Sergey P. All rights reserved.
//

#import "UIViewController+ProjectHelpers.h"

@implementation UIViewController (ProjectHelpers)

- (void)addChildViewController:(UIViewController *)vc onView:(UIView *)view {
    NSParameterAssert(vc);
    NSParameterAssert(view);
    
    [view addSubview:vc.view];
    [self addChildViewController:vc];
    [vc didMoveToParentViewController:self];
}

- (void)removeChildViewControllerFromParent:(UIViewController *)vc {
    NSParameterAssert(vc);
    
    if (vc.parentViewController) {
        [vc willMoveToParentViewController:nil];
        [vc.view removeFromSuperview];
        [vc removeFromParentViewController];
    }
}

@end
