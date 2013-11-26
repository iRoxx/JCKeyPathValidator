//
//  RGObjectKeyPath.m
//  Ragoo
//
//  Created by Jon Crooke on 27/02/2013.
//  Copyright (c) 2013 jc. All rights reserved.
//

#import "RGObjectKeyPath.h"

@implementation RGObjectKeyPathCache

+ (id)cachedInstanceForClass:(Class)k {
  static NSCache *cache = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    cache = [[NSCache alloc] init];
  });
  
  NSString *key = NSStringFromClass(k);
  id ret = [cache objectForKey:key];
  if (!ret) {
    ret = [[k alloc] init];
    [cache setObject:ret forKey:key];
  }
  return ret;
}

@end
