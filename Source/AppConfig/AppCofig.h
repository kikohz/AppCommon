//
//  AppCofig.h
//  mgpyh
//
//  Created by x on 13-11-5.
//  Copyright (c) 2013年 x. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppCofig : NSObject
+(AppCofig *)sharedClient;


- (void)setting:(id)value forKey:(NSString *)key;

- (void)settingBool:(BOOL)enable forKey:(NSString *)key;


- (id)settingForKey:(NSString *)key;

- (BOOL)boolSettingForKey:(NSString *)key;


//特殊用户操作
//生成默认push设置
- (NSDictionary *)generateDefaultPushSetting;

@end
