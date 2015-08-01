//
//  UIScreen+ProjectHelpers.m
//  ProjectHelpers
//
//  Created by Sergey P. on 12.07.12.
//  Copyright (c) 2015 Sergey P. All rights reserved.
//

#import "UIScreen+ProjectHelpers.h"

@implementation UIScreen (ProjectHelpers)

+ (int)screenHeight {
    return [[UIScreen mainScreen] bounds].size.height;
}

+ (int)screenWidth {
    return [[UIScreen mainScreen] bounds].size.width;
}

#pragma mark - Screen size

+ (CGSize)orientedScreenSize {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    if ((NSFoundationVersionNumber <= NSFoundationVersionNumber_iOS_7_1) && UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
        return CGSizeMake(screenSize.height, screenSize.width);
    }
    return screenSize;
}

+ (CGFloat)orientedScreenHeight {
    return [self orientedScreenSize].height;
}

+ (CGFloat)orientedScreenWidth {
    return [self orientedScreenSize].width;
}

@end
