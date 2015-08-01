//
//  PHAlertView.m
//  ProjectHelpers
//
//  Created by Sergey P. on 12.07.12.
//  Copyright (c) 2015 Sergey P. All rights reserved.
//

#import "PHAlertView.h"

@interface PHAlertView ()

@property (nonatomic, copy) AlertBlock alertBlock;

@end

@implementation PHAlertView

+ (id)showWithTitle:(NSString *)title message:(NSString *)message usingBlock:(AlertBlock)block cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ... {
    PHAlertView * alert = [[self alloc] initWithTitle:title
                                                          message:message
                                                         delegate:nil
                                                cancelButtonTitle:cancelButtonTitle
                                                otherButtonTitles:nil];
    
    alert.delegate = alert;
    alert.alertBlock = block;
    
    va_list args;
    va_start(args, otherButtonTitles);
    for (NSString *buttonTitle = otherButtonTitles; buttonTitle != nil; buttonTitle = va_arg(args, NSString*)) {
        [alert addButtonWithTitle:buttonTitle];
    }
    va_end(args);
    
    [alert show];
    
    return alert;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (self.alertBlock) {
        self.alertBlock (buttonIndex);
    }
}

@end
