//
//  ZAConstants.m
//  Bleater
//
//  Created by Ezekiel Abuhoff on 9/18/14.
//  Copyright (c) 2014 Practice. All rights reserved.
//

#import "ZAConstants.h"

@implementation ZAConstants

// Parse Constants
NSString *const PARSE_BASE_URL = @"https://api.parse.com";
NSString *const PARSE_BLEAT_CONTENT_KEY = @"content";
NSString *const PARSE_POST_BLEAT_URL_EXTENSION = @"/1/classes/bleat";
NSString *const PARSE_GET_BLEATS_URL_EXTENSION = @"/1/classes/bleat";

NSString *const PARSE_RESULTS_KEY = @"results";
NSString *const PARSE_BLEAT_PROPERTY_KEY_CONTENT = @"content";
NSString *const PARSE_BLEAT_PROPERTY_KEY_CREATED_AT = @"createdAt";
NSString *const PARSE_BLEAT_PROPERTY_KEY_ID = @"objectId";

NSString *const PARSE_DATE_FORMAT = @"yyyy-MM-dd";

// Core Data Constants
NSInteger const STANDARD_FETCH_BATCH_SIZE = 20;
NSString *const BLEAT_OBJECT_ENTITY_NAME = @"Bleat";
NSString *const BLEAT_DATE_PROPERTY_NAME = @"dateCreated";
NSString *const BLEATS_CACHE_NAME = @"bleatsCache";

NSString *const UNIQUE_ID_PREDICATE_FORMAT = @"uniqueID == %@";

// Manager Constants
NSInteger const CLIPPING_INDEX_OF_DATE = 10;

// IB Identifiers
NSString *const BLEAT_CELL_IDENTIFIER = @"bleatCell";

@end
