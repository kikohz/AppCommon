//
//  BackwardCompatibilityCGRect.h
//  TestXcode5
//
//  Created by Albert Chu on 13-9-19.
//  Copyright (c) 2013年 Albert Chu. All rights reserved.
//

#import <Foundation/Foundation.h>


#define SystemVersion_floatValue    ([[[UIDevice currentDevice] systemVersion] floatValue])


#define CGRM_InNav(x, y, w, h)      \
[[FitCGRect sharedInstance] fitCGRectInNavBy:(x+0.f) and:(y+0.f) and:(w+0.f) and:(h+0.f)]

#define CGRM_(x, y, w, h)           \
[[FitCGRect sharedInstance] fitCGRectBy:(x+0.f) and:(y+0.f) and:(w+0.f) and:(h+0.f)]


#define Screen_Height   ([[UIScreen mainScreen] applicationFrame].size.height + 20.f)


typedef enum
{
    ScrollView_With_NavBar = 116799992,
    ScrollView_With_NavBar_TabBar
} ScrollView_With;

#define ScrollView_Height_With_NavBar          \
[[FitCGRect sharedInstance] fitScrollViewHeightBy:ScrollView_With_NavBar]

#define ScrollView_Height_With_NavBar_TabBar   \
[[FitCGRect sharedInstance] fitScrollViewHeightBy:ScrollView_With_NavBar_TabBar]


@interface FitCGRect : NSObject

/**
 * 单例
 */
+ (FitCGRect *)sharedInstance;

/**
 * 适配被加在 处于 UINavigationController 中的 UIViewController self.view 上的 坐标
 */
- (CGRect)fitCGRectInNavBy:(CGFloat)x and:(CGFloat)y and:(CGFloat)w and:(CGFloat)h;

/**
 * 适配被加在 不处于 UINavigationController 中的 UIViewController self.view 上的 坐标
 */
- (CGRect)fitCGRectBy:(CGFloat)x and:(CGFloat)y and:(CGFloat)w and:(CGFloat)h;

/**
 * 适配 UIScrollView 的高度
 */
- (CGFloat)fitScrollViewHeightBy:(NSInteger)type;


@end
