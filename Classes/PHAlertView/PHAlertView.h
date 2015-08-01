//
//  PHAlertView.h
//  ProjectHelpers
//
//  Created by Sergey P. on 12.07.12.
//  Copyright (c) 2015 Sergey P. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^AlertBlock)(NSUInteger index);

@interface PHAlertView : UIAlertView

+ (id)showWithTitle:(NSString *)title
            message:(NSString *)message
         usingBlock:(AlertBlock)block
  cancelButtonTitle:(NSString *)cancelButtonTitle
  otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;

@end
