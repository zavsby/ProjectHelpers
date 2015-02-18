//  PHTextView.h
//  ProjectHelpers
//
//  Created by Sergey P. on 12.07.12.
//  Copyright (c) 2015 Sergey P. All rights reserved.
//

@import Foundation;
@import UIKit;

@interface PHTextView : UITextView
{
    NSString *placeholder;
    UIColor *placeholderColor;
@private
    UILabel *placeHolderLabel;
}

@property (nonatomic, retain) UILabel *placeHolderLabel;
@property (nonatomic, retain) NSString *placeholder;
@property (nonatomic, retain) UIColor *placeholderColor;

- (void)textChanged:(NSNotification *)notification;

@end