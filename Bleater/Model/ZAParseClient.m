//
//  ZAParseClient.m
//  Bleater
//
//  Created by Ezekiel Abuhoff on 9/18/14.
//  Copyright (c) 2014 Practice. All rights reserved.
//

#import "ZAParseClient.h"
#import "ZAConstants.h"
#import "ZAPrivateCredentials.h"
#import <AFNetworking.h>

@interface ZAParseClient ()

@property (strong, nonatomic) AFHTTPSessionManager *sessionManager;

@end

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

#pragma mark - Property Lazy Instantiation

- (AFHTTPSessionManager *)sessionManager
{
    if (!_sessionManager)
    {
        _sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:PARSE_BASE_URL]];
        [self setUpSessionManager];
    }
    
    return _sessionManager;
}

- (void) setUpSessionManager
{
    _sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [_sessionManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [_sessionManager.requestSerializer setValue:PARSE_APP_ID forHTTPHeaderField:@"X-Parse-Application-Id"];
    [_sessionManager.requestSerializer setValue:PARSE_API_KEY forHTTPHeaderField:@"X-Parse-REST-API-Key"];
}

#pragma mark - Parse Functions

// This method calls on Parse to return all objects of the Bleat class.
// Its success block provides a dictionary that conveys this data.
- (void) getBleatsWithSuccess: (void (^)(NSDictionary *))success
                      failure: (void (^)(NSString *))failure
{    
    [self.sessionManager GET:PARSE_GET_BLEATS_URL_EXTENSION parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSLog(@"Failure to get bleats - error mesage: %@",error);
        failure(@"error");
        
    }];
}

// This method calls Parse to create a new Bleat object.
// Its success block provides Parse's confirmation response,
// which is the new objects's createdAt date and its unique
// identifier string.
- (void) postBleatWithContent: (NSString *)content
                      success: (void (^)(NSDictionary *))success
                      failure: (void (^)(NSString *))failure
{
    NSDictionary *params = @{PARSE_BLEAT_CONTENT_KEY: content};
    
    [self.sessionManager POST:PARSE_POST_BLEAT_URL_EXTENSION parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSLog(@"Failure to post bleat - error mesage: %@",error);
        failure(@"error");
        
    }];
}

@end
