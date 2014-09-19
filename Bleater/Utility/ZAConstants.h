//
//  ZAConstants.h
//  Bleater
//
//  Created by Ezekiel Abuhoff on 9/18/14.
//  Copyright (c) 2014 Practice. All rights reserved.
//

//  CONSTANTS
//
//  This class provides a single place to check and edit
//  all constants in the app. It's useful for tweaking
//  and avoiding namespace conflicts.

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

// UI Constants
extern float const BLEAT_BACKDROP_CORNER_RADIUS;
extern float const HEIGHT_FOR_FEED_ROW;

// Alert View Constants
extern NSString *const ALERT_TITLE;
extern NSString *const ALERT_MESSAGE;
extern NSString *const ALERT_CANCEL;

@end
