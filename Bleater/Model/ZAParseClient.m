//
//  ZAParseClient.m
//  Bleater
//
//  Created by Ezekiel Abuhoff on 9/18/14.
//  Copyright (c) 2014 Practice. All rights reserved.
//

#import "ZAParseClient.h"
#import <AFNetworking.h>

@implementation ZAParseClient

#pragma mark - Singleton Method

+ (instancetype) singleton
{
    static ZAParseClient *_shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shared = [[ZAParseClient alloc] init];
    });
    
    return _shared;
}

@end
