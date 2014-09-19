//
//  ZAParseClient.h
//  Bleater
//
//  Created by Ezekiel Abuhoff on 9/18/14.
//  Copyright (c) 2014 Practice. All rights reserved.
//

// PARSE CLIENT
//
// This class manages communication with the backend-as-service
// known as Parse through HTTP requests. It retrieves data and
// posts data.

#import <Foundation/Foundation.h>

@interface ZAParseClient : NSObject

// Singleton Method
+ (instancetype) singleton;

// Parse Functions
- (void) getBleatsWithSuccess: (void (^)(NSDictionary *))success
                      failure: (void (^)(NSString *))failure;
- (void) postBleatWithContent: (NSString *)content
                      success: (void (^)(NSDictionary *))success
                      failure: (void (^)(NSString *))failure;

@end
