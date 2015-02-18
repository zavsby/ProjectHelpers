//
//  UIViewController+ErrorAlert.m
//  ProjectHelpers
//
//  Created by Sergey P. on 12.07.12.
//  Copyright (c) 2015 Sergey P. All rights reserved.
//
#import "UIViewController+ErrorAlert.h"

@implementation UIViewController (ErrorAlert)

- (void)showError:(NSError *)error
{
    UIAlertView  *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"key.shared.error", nil) message:error.localizedDescription delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}

- (void)showMessage:(NSString *)message
{
//    if ([UIDevice isIOS8])
//    {
//        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert];
//        [self presentViewController:alertController animated:YES completion:nil];
//    }
//    else
    {
        [[[UIAlertView alloc] initWithTitle:nil message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil] show];
    }
}

- (void)showMessage:(NSString *)message withTitle:(NSString *)title
{
//    if ([UIDevice isIOS8])
//    {
//        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
//        [self presentViewController:alertController animated:YES completion:nil];
//    }
//    else
    {
        [[[UIAlertView alloc] initWithTitle:title ? title : NSLocalizedString(@"Message", nil) message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil] show];
    }
}

@end
