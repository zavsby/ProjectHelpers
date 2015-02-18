//
//  UIScrollView+ProjectHelpers.m
//  ProjectHelpers
//
//  Created by Sergey P. on 12.07.12.
//  Copyright (c) 2015 Sergey P. All rights reserved.
//

#import "UIScrollView+ProjectHelpers.h"

@implementation UIScrollView (ProjectHelpers)

- (void)setTopContentInsets:(int)topInset
{
    self.contentInset = UIEdgeInsetsMake(topInset, self.contentInset.left, self.contentInset.bottom, self.contentInset.right);
}

- (void)setBottomContentInsets:(int)bottomInset
{
    self.contentInset = UIEdgeInsetsMake(self.contentInset.top, self.contentInset.left, bottomInset, self.contentInset.right);
}

@end
