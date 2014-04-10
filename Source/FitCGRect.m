//
//  BackwardCompatibilityCGRect.m
//  TestXcode5
//
//  Created by Albert Chu on 13-9-19.
//  Copyright (c) 2013年 Albert Chu. All rights reserved.
//

#import "FitCGRect.h"


@implementation FitCGRect


#pragma mark - Singleton

+ (FitCGRect *)sharedInstance
{
    static dispatch_once_t pred;
    static FitCGRect *sharedInstance = nil;
    
    dispatch_once(&pred, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}


#pragma mark - Public Methods

- (CGRect)fitCGRectInNavBy:(CGFloat)x and:(CGFloat)y and:(CGFloat)w and:(CGFloat)h
{
    if ( SystemVersion_floatValue >= 7.f )
    {
        return CGRectMake(x, y, w, h-20.f);
    }
    else
    {
        return CGRectMake(x, y,/*(y-64.f)*/ w, h-20.f);
    }
}

- (CGRect)fitCGRectBy:(CGFloat)x and:(CGFloat)y and:(CGFloat)w and:(CGFloat)h
{
    if ( SystemVersion_floatValue >= 7.f )
    {
        return CGRectMake(x, y, w, h-20.f);
    }
    else
    {
        return CGRectMake(x, y, w, h);
    }
}

- (CGFloat)fitScrollViewHeightBy:(NSInteger)type
{
    if ( SystemVersion_floatValue < 7.f )
    {
        switch (type)
        {
            case ScrollView_With_NavBar:
                return (Screen_Height - 64.f);
                break;
                
            case ScrollView_With_NavBar_TabBar:
                return (Screen_Height - 64.f - 52.f);
                break;
        }
        return 0;
    }
    
    else
    {
        return Screen_Height;
    }
}


@end
