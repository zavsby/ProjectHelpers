//
//  ProjectHelpers-Defs.h
//  ProjectHelpers
//
//  Created by Sergey P. on 12.07.12.
//  Copyright (c) 2015 Sergey P. All rights reserved.
//

#define PERFORM_BLOCK(block, ...) block ? block(__VA_ARGS__) : nil

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending

// Time Perfomance testing
#define START_TIME_PERFOMANCE_TEST NSDate *date1 = [NSDate date];
#define END_TIME_PERFOMANCE_TEST NSDate *date2 = [NSDate date]; DDLogInfo(@"%s time is %f", __PRETTY_FUNCTION__, date2.timeIntervalSince1970 - date1.timeIntervalSince1970);

#define ONE_DEVICE_PIXEL (1.0f / [UIScreen mainScreen].scale)

#define PHDefineUpdateConstraints @property (nonatomic, assign) BOOL didSetupConstraints;
#define PHUpdateConstraints() - (void)updateConstraints {\
if (!self.didSetupConstraints) {\
    [self addConstraints];\
    self.didSetupConstraints = YES;\
}\
[super updateConstraints];\
}

// Generic blocks
typedef void(^PHVoidBlock) ();
typedef void(^PHObjectBlock) (id obj);
typedef BOOL(^PHPredicateBlock) (id obj);
typedef void(^PHPairBlock) (id obj1, id obj2);
typedef id(^PHObjectWithReturnBlock) (id obj);