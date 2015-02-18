//
//  PHTextField.m
//  ProjectHelpers
//
//  Created by Sergey P. on 12.07.12.
//  Copyright (c) 2015 Sergey P. All rights reserved.
//

#import "PHTextField.h"

@implementation PHTextField

- (CGRect)textRectForBounds:(CGRect)bounds
{
    return CGRectInset(bounds, self.textRectInset.width, self.textRectInset.height);
}

- (CGRect)editingRectForBounds:(CGRect)bounds
{
    return CGRectInset(bounds, self.textRectInset.width, self.textRectInset.height);
}

@end
