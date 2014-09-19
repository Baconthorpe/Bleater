//
//  ZAManager.h
//  Bleater
//
//  Created by Ezekiel Abuhoff on 9/18/14.
//  Copyright (c) 2014 Practice. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZAManager : NSObject

// Singleton Method
+ (instancetype) singleton;

// Parse Functionality
- (void) getAllBleatsAndStoreThemWithSuccess: (void (^)(NSDictionary *))success
                                     failure: (void (^)(NSString *))failure;
- (void) postAndStoreBleatWithContent: (NSString *)content
                              success: (void (^)(NSDictionary *))success
                              failure: (void (^)(NSString *))failure;

@end
