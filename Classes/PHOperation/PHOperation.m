//
//  NSSimpleOperation.m
//  ProjectHelpers
//
//  Created by Sergey P. on 12.07.12.
//  Copyright (c) 2015 Sergey P. All rights reserved.
//

#import "PHOperation.h"

@implementation PHOperation

-(void)start
{
    if ([self isCancelled])
    {
        [self willChangeValueForKey:@"isFinished"];
        finished = YES;
        [self didChangeValueForKey:@"isFinished"];
        return;
    }
    [self willChangeValueForKey:@"isExecuting"];
    executing = YES;
    [self didChangeValueForKey:@"isExecuting"];
    [self main];
}

-(void)main
{
    // SHOULD BE OVERRIDEN IN YOUR OPERATION
}

-(void)completeOperation
{
    [self willChangeValueForKey:@"isFinished"];
    [self willChangeValueForKey:@"isExecuting"];
    executing = NO;
    finished = YES;
    [self didChangeValueForKey:@"isFinished"];
    [self didChangeValueForKey:@"isExecuting"];
}

-(BOOL)isExecuting
{
    return executing;
}

-(BOOL)isFinished
{
    return finished;
}

-(BOOL)isConcurrent
{
    return YES;
}

@end
