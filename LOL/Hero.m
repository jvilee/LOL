//
//  Hero.m
//  LOL
//
//  Created by jvilee on 16/7/31.
//  Copyright © 2016年 me. All rights reserved.
//

#import "Hero.h"

@implementation Hero


-(instancetype)initWithDict:(NSDictionary *)dict{
    
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    
    return self;
    
}
+(instancetype)heroWithDict:(NSDictionary *)dict{
    
    return  [[self alloc] initWithDict:dict];
}
@end
