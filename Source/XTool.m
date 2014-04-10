//
//  XTool.m
//  mgpyh
//
//  Created by x on 13-10-27.
//  Copyright (c) 2013年 x. All rights reserved.
//

#import "XTool.h"
#import "AppCommon.h"

@implementation XTool


//获取当前的viewcontroller
+ (UIViewController *)getCurrentRootViewController {
    
    UIViewController *result;
    
    // Try to find the root view controller programmically
    
    // Find the top window (that is not an alert view or other window)
    UIWindow *topWindow = [[UIApplication sharedApplication] keyWindow];
    if (topWindow.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(topWindow in windows)
        {
            if (topWindow.windowLevel == UIWindowLevelNormal)
                break;
        }
    }
    
    UIView *rootView = [[topWindow subviews] objectAtIndex:0];
    id nextResponder = [rootView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else if ([topWindow respondsToSelector:@selector(rootViewController)] && topWindow.rootViewController != nil)
        result = topWindow.rootViewController;
    else
        NSAssert(NO, @"ShareKit: Could not find a root view controller.  You can assign one manually by calling [[SHK currentHelper] setRootViewController:YOURROOTVIEWCONTROLLER].");
	
    return result;
}

//app的版本
+ (NSString *)appVersion
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    // app版本
    NSString *version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    return version;
}

+ (NSString *)flattenHTML:(NSString *)html {
  
  NSString *text = nil;
  NSScanner *thescanner = [NSScanner scannerWithString:html];
  
  while ([thescanner isAtEnd] == NO) {
    
    // find start of tag
    [thescanner scanUpToString:@"<" intoString:NULL];
    
    // find end of tag
    [thescanner scanUpToString:@">" intoString:&text] ;
    
    // replace the found tag with a space
    //(you can filter multi-spaces out later if you wish)
    html = [html stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>",text] withString:@" "];
  } // while //
  
  return html;
}


//手机机型
+ (NSString *)deviceModel
{
    UIDevice *dev = [UIDevice currentDevice];
    return dev.model;
}
//MD5编码
+ (NSString *)md5String:(NSString *)string
{
    const char *cStr = [string UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, strlen(cStr), result ); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];  
}

+ (UIImage *)createImage:(UIColor *)color
{
  CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
  UIGraphicsBeginImageContext(rect.size);
  CGContextRef context = UIGraphicsGetCurrentContext();
  CGContextSetFillColorWithColor(context, [color CGColor]);
  CGContextFillRect(context, rect);
  
  UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return theImage;
}

/**
 *  计算字符串显示在指定的界面上的时候
 *
 *  @param text  需要计算的文字
 *  @param font  字体
 *  @param width 文字显示在界面上的宽度
 *
 *  @return 返回字符串显示在界面上所需要的宽和高
 */
+ (CGSize)textSizeWith:(NSString *)text Font:(UIFont *)font ShowWidth:(CGFloat)width
{
  CGSize textSize;
  if(SYS_VER_7){
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle.copy};
    
    CGSize labelSize = [text boundingRectWithSize:CGSizeMake(width, 999) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    
    textSize.height = ceil(labelSize.height);
    textSize.width = ceil(labelSize.width);
  }
  else
    textSize = [text sizeWithFont:font constrainedToSize:CGSizeMake(width, CGFLOAT_MAX) lineBreakMode:NSLineBreakByWordWrapping];
  
  return textSize;
}

@end
