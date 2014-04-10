//
//  LevelDB+Cache.m
//  AppCommon
//
//  Created by x on 14-4-10.
//  Copyright (c) 2014年 x. All rights reserved.
//

#import "LevelDB+Cache.h"

@implementation LevelDB (Cache)


+ (id)cache
{
  static id cache;
  static dispatch_once_t predicate;
  
  dispatch_once(&predicate, ^{
    cache = [[self class] databaseInLibraryWithName:@"cache.ldb"];
    
    LevelDBEncoderBlock encoder = ^ NSData *(LevelDBKey *key, id object) {
      
      return [NSKeyedArchiver archivedDataWithRootObject:object];
    };
    LevelDBDecoderBlock decoder =  ^ id (LevelDBKey *key, NSData *data) {
      
      return [NSKeyedUnarchiver unarchiveObjectWithData:data];
    };
    
    [cache setEncoder:encoder];
    [cache setDecoder:decoder];
  });
  
  return cache;
}
@end
