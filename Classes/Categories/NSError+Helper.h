//
//  NSError+Helper.h
//  ProjectHelpers
//
//  Created by Sergey P. on 12.07.12.
//  Copyright (c) 2015 Sergey P. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSError (Helper)

+ (id)errorWithDomain:(NSString *)domain description:(NSString *)desc code:(NSInteger)c;

@end
