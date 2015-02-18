//
//  UIViewController+ErrorAlert.h
//  ProjectHelpers
//
//  Created by Sergey P. on 12.07.12.
//  Copyright (c) 2015 Sergey P. All rights reserved.
//

@import UIKit;
#import "UIDevice+ProjectHelpers.h"

@interface UIViewController (ErrorAlert)

- (void)showError:(NSError *)error;
- (void)showMessage:(NSString *)message withTitle:(NSString *)title;
- (void)showMessage:(NSString *)message __attribute__((deprecated));

@end
