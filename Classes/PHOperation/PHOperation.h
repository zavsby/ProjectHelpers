//
//  NSSimpleOperation.h
//  ProjectHelpers
//
//  Created by Sergey P. on 12.07.12.
//  Copyright (c) 2015 Sergey P. All rights reserved.
//

#import <Foundation/Foundation.h>

// Для того чтобы определить свою операцию нужно переопределить метод main
// После завершения действий внутри операции нужно вызывать метод -completeOperation

@interface PHOperation : NSOperation
{
    BOOL executing;
    BOOL finished;
}

-(void)completeOperation;

@end
