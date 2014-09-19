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

extern NSString *const PARSE_RESULTS_KEY;
extern NSString *const PARSE_BLEAT_PROPERTY_KEY_CONTENT;
extern NSString *const PARSE_BLEAT_PROPERTY_KEY_CREATED_AT;
extern NSString *const PARSE_BLEAT_PROPERTY_KEY_ID;

extern NSString *const PARSE_DATE_FORMAT;

// Core Data Constants
extern NSInteger const STANDARD_FETCH_BATCH_SIZE;
extern NSString *const BLEAT_OBJECT_ENTITY_NAME;
extern NSString *const BLEAT_DATE_PROPERTY_NAME;
extern NSString *const BLEATS_CACHE_NAME;

extern NSString *const UNIQUE_ID_PREDICATE_FORMAT;

// Manager Constants
extern NSInteger const CLIPPING_INDEX_OF_DATE;

// IB Identifiers
extern NSString *const BLEAT_CELL_IDENTIFIER;

@end
