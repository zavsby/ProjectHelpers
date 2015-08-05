//
//  NSSimpleOperation.m
//  ProjectHelpers
//
//  Created by Sergey P. on 12.07.12.
//  Copyright (c) 2015 Sergey P. All rights reserved.
//

#import "PHOperation.h"

@interface PHOperation ()

@property (nonatomic, assign) BOOL operationExecuting;
@property (nonatomic, assign) BOOL operationFinished;

@end

@implementation PHOperation

- (void)start {
    if ([self isCancelled]) {
        [self willChangeValueForKey:@"isFinished"];
        self.operationFinished = YES;
        [self didChangeValueForKey:@"isFinished"];
        return;
    }
    
    [self willChangeValueForKey:@"isExecuting"];
    self.operationExecuting = YES;
    [self didChangeValueForKey:@"isExecuting"];
    
    [self main];
}

- (void)main {
    // SHOULD BE OVERRIDEN IN YOUR OPERATION
}

- (void)completeOperation {
    [self willChangeValueForKey:@"isFinished"];
    [self willChangeValueForKey:@"isExecuting"];
    self.operationExecuting = NO;
    self.operationFinished = YES;
    [self didChangeValueForKey:@"isFinished"];
    [self didChangeValueForKey:@"isExecuting"];
}

- (BOOL)isExecuting {
    return self.operationExecuting;
}

- (BOOL)isFinished {
    return self.operationFinished;
}

- (BOOL)isConcurrent {
    return YES;
}

@end
