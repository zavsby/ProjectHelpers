//
//  UISearchBar+BackgroundExtension.m
//  ProjectHelpers
//
//  Created by Sergey P. on 12.07.12.
//  Copyright (c) 2015 Sergey P. All rights reserved.
//
#import "UISearchBar+BackgroundExtension.h"

@implementation UISearchBar (BackgroundExtension)

-(void)setSearchBarBackgroundImage:(UIImage *)image
{
    if (image == nil)
    {
        NSArray *subviews = [self subviews];
        for (int i = 0; i < [subviews count]; i++)
        {
            if ([[subviews objectAtIndex:i]  isMemberOfClass:NSClassFromString(@"UISearchBarBackground")])
            {
                [[subviews objectAtIndex:i] removeFromSuperview];
            }
        }
        return;
    }
    if ([self respondsToSelector:@selector(setBackgroundImage:)])
    {
        [self setBackgroundImage:image];
    }
    else
    {
        NSArray *subviews = [self subviews];  
        for (int i=0; i<[subviews count]; i++) 
        {  
            if ([[subviews objectAtIndex:i]  isMemberOfClass:NSClassFromString(@"UISearchBarBackground")])
            {  
                [[subviews objectAtIndex:i] removeFromSuperview];  
            }
        }
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];  
        imageView.frame = CGRectMake(0, 0, 320, 44);
        [self insertSubview:imageView atIndex:1]; 
    }
}

-(void)setTextFieldBackgroundImage:(UIImage *)image
{
    for (int i=0;i<self.subviews.count;i++)
    {
        if ([[self.subviews objectAtIndex:i] isKindOfClass:NSClassFromString(@"UISearchBarTextField")])
        {
            UITextField* searchField = (UITextField*)[self.subviews objectAtIndex:i];
            searchField.leftViewMode = UITextFieldViewModeAlways;
            searchField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"values_searchIcon"]];
            searchField.clearButtonMode = UITextFieldViewModeNever;
            searchField.background = image;
            [searchField setTextColor:[UIColor grayColor]];
        }
    }
}

-(void)setCustomCancelButtonBackgroundImage:(UIImage*)image
{
    UIButton* cancelButton = nil;
    for(UIView *subView in self.subviews)
    {
        NSLog(@"%@",[subView class]);
        if([subView isKindOfClass:[UIButton class]])
        {
            cancelButton = (UIButton*)subView;
        }
    }
    NSLog(@"height=%f weight=%f",cancelButton.frame.size.height,cancelButton.frame.size.width);
    if (cancelButton)
    {
        [cancelButton setBackgroundImage:image forState:UIControlStateNormal];
    }
}

@end
