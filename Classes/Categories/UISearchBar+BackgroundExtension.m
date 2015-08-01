//
//  UISearchBar+BackgroundExtension.m
//  ProjectHelpers
//
//  Created by Sergey P. on 12.07.12.
//  Copyright (c) 2015 Sergey P. All rights reserved.
//
#import "UISearchBar+BackgroundExtension.h"

@implementation UISearchBar (BackgroundExtension)

- (void)setTextFieldBackgroundImage:(UIImage *)image {
    for (NSInteger i = 0; i < self.subviews.count; i++) {
        if ([[self.subviews objectAtIndex:i] isKindOfClass:NSClassFromString(@"UISearchBarTextField")]) {
            UITextField *searchField = (UITextField *)[self.subviews objectAtIndex:i];
            searchField.leftViewMode = UITextFieldViewModeAlways;
            searchField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"values_searchIcon"]];
            searchField.clearButtonMode = UITextFieldViewModeNever;
            searchField.background = image;
            [searchField setTextColor:[UIColor grayColor]];
        }
    }
}

- (void)setCustomCancelButtonBackgroundImage:(UIImage *)image {
    UIButton *cancelButton = nil;
    for(UIView *subView in self.subviews) {
        if ([subView isKindOfClass:[UIButton class]]) {
            cancelButton = (UIButton *)subView;
        }
    }

    if (cancelButton) {
        [cancelButton setBackgroundImage:image forState:UIControlStateNormal];
    }
}

@end
