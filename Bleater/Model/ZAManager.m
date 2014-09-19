//
//  ZAManager.m
//  Bleater
//
//  Created by Ezekiel Abuhoff on 9/18/14.
//  Copyright (c) 2014 Practice. All rights reserved.
//

#import "ZAManager.h"
#import "ZADataStore.h"
#import "ZAParseClient.h"

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

#pragma mark - Parse Functionality

- (void) getAllBleatsAndStoreThemWithSuccess: (void (^)(NSDictionary *))success
                                     failure: (void (^)(NSString *))failure
{
    [[ZAParseClient singleton] getBleatsWithSuccess:^(NSDictionary *responseDictionary) {
        
        [self storeBleatsFromDictionary:responseDictionary];
        
        success(responseDictionary);
        
    } failure:^(NSString *error) {
        
        failure(error);
        
    }];
}

- (void) storeBleatsFromDictionary: (NSDictionary *)bleatsDictionary
{
    
}

@end
