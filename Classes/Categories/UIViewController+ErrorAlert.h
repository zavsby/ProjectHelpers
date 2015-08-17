//
//  UIViewController+ErrorAlert.h
//  ProjectHelpers
//
//  Created by Sergey P. on 12.07.12.
//  Copyright (c) 2015 Sergey P. All rights reserved.
//

@import UIKit;

@interface UIViewController (ErrorAlert)

- (void)showError:(NSError *)error __attribute__((deprecated));;
- (void)showMessage:(NSString *)message withTitle:(NSString *)title __attribute__((deprecated));;
- (void)showMessage:(NSString *)message __attribute__((deprecated));

@end
