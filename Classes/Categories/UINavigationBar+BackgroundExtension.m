//
//  UINavigationBar+BackgroundExtension.m
//  ProjectHelpers
//
//  Created by Sergey P. on 12.07.12.
//  Copyright (c) 2015 Sergey P. All rights reserved.
//

#import "UINavigationBar+BackgroundExtension.h"

@implementation UINavigationBar (BackgroundExtension)

-(void)setNavigationBarBackground:(UIImage *)image
{
    if ([self respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)])
    {
        [self setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    }
    else
    {
        NSArray *subviews = [self subviews];  
        for (int i=0; i<[subviews count]; i++) 
        {  
            if ([[subviews objectAtIndex:i]  isMemberOfClass:[UIImageView class]]) 
            {  
                [[subviews objectAtIndex:i] removeFromSuperview];  
            }
        }
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];  
        imageView.frame = CGRectMake(0, 0, 320, 44);
        [self addSubview:imageView]; 
    }
}

@end
