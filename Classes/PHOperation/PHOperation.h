//
//  NSSimpleOperation.h
//  ProjectHelpers
//
//  Created by Sergey P. on 12.07.12.
//  Copyright (c) 2015 Sergey P. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 *  If you need to create your own operation you should override -main method.
 *  After completing all necessary actions you should call -completeOperation method.
 */
@interface PHOperation : NSOperation

- (void)completeOperation;

@end
