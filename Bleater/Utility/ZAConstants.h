//
//  ZAConstants.h
//  Bleater
//
//  Created by Ezekiel Abuhoff on 9/18/14.
//  Copyright (c) 2014 Practice. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZAConstants : NSObject

// Parse Constants
extern NSString *const PARSE_BASE_URL;
extern NSString *const PARSE_BLEAT_CONTENT_KEY;
extern NSString *const PARSE_POST_BLEAT_URL_EXTENSION;
extern NSString *const PARSE_GET_BLEATS_URL_EXTENSION;

// Core Data Constants
extern NSInteger const STANDARD_FETCH_BATCH_SIZE;
extern NSString *const BLEAT_OBJECT_ENTITY_NAME;
extern NSString *const BLEAT_DATE_PROPERTY_NAME;
extern NSString *const BLEATS_CACHE_NAME;

@end
