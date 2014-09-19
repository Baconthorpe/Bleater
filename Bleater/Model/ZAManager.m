//
//  ZAManager.m
//  Bleater
//
//  Created by Ezekiel Abuhoff on 9/18/14.
//  Copyright (c) 2014 Practice. All rights reserved.
//

#import "ZAManager.h"

@implementation ZAManager

#pragma mark - Singleton

+ (instancetype) singleton
{
    static ZAManager *_shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shared = [[ZAManager alloc] init];
    });
    
    return _shared;
}

@end
