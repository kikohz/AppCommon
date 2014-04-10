//
//  XTool.h
//  mgpyh
//
//  Created by x on 13-10-27.
//  Copyright (c) 2013年 x. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CommonCrypto/CommonDigest.h>

@interface XTool : NSObject

/**
 *  获取当前viewcontroller
 *
 *  @return 当前活动的viewcontroller
 */
+ (UIViewController *)getCurrentRootViewController;
/**
 *  app版本
 *
 *  @return 返回当前app版本
 */
+ (NSString *)appVersion;
/**
 *  过滤html字符串
 *
 *  @param html html 字符串
 *
 *  @return 过滤好的字符串
 */
+ (NSString *)flattenHTML:(NSString *)html;

//手机机型
+ (NSString *)deviceModel;

+ (NSString *)md5String:(NSString *)string;

/**
 *  通过色值创建image
 *
 *  @param color 颜色
 *
 *  @return 创建好的图片
 */
+ (UIImage *)createImage:(UIColor *)color;
/**
 *  计算字符串size
 *
 *  @param text  要计算的文字
 *  @param font  显示在界面上的字体
 *  @param width 显示在界面上控件的宽度
 *
 *  @return 计算好的大小
 */
+ (CGSize)textSizeWith:(NSString *)text Font:(UIFont *)font ShowWidth:(CGFloat)width;

@end
