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
#import "ZAConstants.h"
#import "Bleat+Methods.h"

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

// This method uses the Parse client to get Bleat data, then,
// if this call was successful, stores this data using the
// data store.
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

// This method helps the method above.
- (void) storeBleatsFromDictionary: (NSDictionary *)bleatsDictionary
{
    for (NSDictionary *singleBleatDictionary in bleatsDictionary[PARSE_RESULTS_KEY]) {
        [self storeSingleBleatFromDictionary:singleBleatDictionary];
    }
}

// This method helps the method above.
- (void) storeSingleBleatFromDictionary: (NSDictionary *)bleatDictionary
{
    NSString *uniqueID = bleatDictionary[PARSE_BLEAT_PROPERTY_KEY_ID];
    
    if (![[ZADataStore singleton] contextHasBleatOfUniqueID:uniqueID])
    {
        NSString *content = bleatDictionary[PARSE_BLEAT_CONTENT_KEY];
        
        NSString *rawDate = bleatDictionary[PARSE_BLEAT_PROPERTY_KEY_CREATED_AT];
        NSString *clippedDate = [rawDate substringToIndex:CLIPPING_INDEX_OF_DATE];
        NSDateFormatter *formatter = [NSDateFormatter new];
        [formatter setDateFormat:PARSE_DATE_FORMAT];
        NSDate *decodedDate = [formatter dateFromString:clippedDate];
        
        [Bleat bleatWithContent:content
                      createdAt:decodedDate
                       uniqueID:uniqueID
                      inContext:[ZADataStore singleton].managedObjectContext];
    }
}

// This method uses the Parse client to create a new Bleat object
// in the database and, if that action is successful, saves a local
// copy of the object with the data store.
- (void) postAndStoreBleatWithContent: (NSString *)content
                              success: (void (^)(NSDictionary *))success
                              failure: (void (^)(NSString *))failure
{
    [[ZAParseClient singleton] postBleatWithContent:content success:^(NSDictionary *confirmationDictionary) {
        
        [self storeNewlyPostedBleatWithConfirmationDictionary:confirmationDictionary content:content];
        
        success(confirmationDictionary);
        
    } failure:^(NSString *error) {
        
        failure(error);
        
    }];
}

// This method helps the method above.
- (void) storeNewlyPostedBleatWithConfirmationDictionary: (NSDictionary *)confirmationDictionary
                                                 content: (NSString *)content
{
    NSString *uniqueID = confirmationDictionary[PARSE_BLEAT_PROPERTY_KEY_ID];
    
    NSString *rawDate = confirmationDictionary[PARSE_BLEAT_PROPERTY_KEY_CREATED_AT];
    NSString *clippedDate = [rawDate substringToIndex:CLIPPING_INDEX_OF_DATE];
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:PARSE_DATE_FORMAT];
    NSDate *decodedDate = [formatter dateFromString:clippedDate];
    
    [Bleat bleatWithContent:content
                  createdAt:decodedDate
                   uniqueID:uniqueID
                  inContext:[ZADataStore singleton].managedObjectContext];
}

@end
