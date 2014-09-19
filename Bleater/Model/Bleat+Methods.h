//
//  Bleat+Methods.h
//  Bleater
//
//  Created by Ezekiel Abuhoff on 9/19/14.
//  Copyright (c) 2014 Practice. All rights reserved.
//

#import "Bleat.h"

@interface Bleat (Methods)

// Instantiation
+ (instancetype) bleatWithContent: (NSString *)contentString
                        createdAt: (NSDate *)createdAt
                         uniqueID: (NSString *)uniqueID
                        inContext: (NSManagedObjectContext *)context;

@end
