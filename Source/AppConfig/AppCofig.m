//
//  AppCofig.m
//  mgpyh
//
//  Created by x on 13-11-5.
//  Copyright (c) 2013年 x. All rights reserved.
//

#import "AppCofig.h"
#import "UtilitiesMacro.h"

@implementation AppCofig
+(AppCofig *)sharedClient
{
    static AppCofig *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[AppCofig alloc] init];
    });
    return _sharedClient;
}

- (void)setting:(id)value forKey:(NSString *)key
{
    if(value && key){
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:value forKey:key];
        [defaults synchronize];
    }
}

- (void)settingBool:(BOOL)enable forKey:(NSString *)key
{
    if(key){
    
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setBool:enable forKey:key];
        [defaults synchronize];
    
    }
}
- (BOOL)boolSettingForKey:(NSString *)key
{
    if(key){
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        return [defaults boolForKey:key];
    }
    else
        return NO;
}

- (id)settingForKey:(NSString *)key
{
    if(!key)
        return nil;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:key];
}


- (NSDictionary *)generateDefaultPushSetting
{
    NSArray *category = [NSArray array];
    NSString *token = [[AppCofig sharedClient] settingForKey:kToken];
    if(!token)
        token = @"";
    NSDictionary *item = @{@"category":category,@"token":token,@"push_time_period":@"08:00--22:00",@"push_enable":[NSNumber numberWithBool:YES]};
    return item;
}


@end
