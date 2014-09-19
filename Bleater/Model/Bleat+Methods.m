//
//  Bleat+Methods.m
//  Bleater
//
//  Created by Ezekiel Abuhoff on 9/19/14.
//  Copyright (c) 2014 Practice. All rights reserved.
//

#import "Bleat+Methods.h"
#import "ZAConstants.h"

@implementation Bleat (Methods)

#pragma mark - Instantiation

// This method produces a Bleat object according to provided
// details. It makes storing Bleats quick and easy.
+ (instancetype) bleatWithContent: (NSString *)contentString
                        createdAt: (NSDate *)createdAt
                         uniqueID: (NSString *)uniqueID
                        inContext: (NSManagedObjectContext *)context
{
    Bleat *newBleat = [NSEntityDescription insertNewObjectForEntityForName:BLEAT_OBJECT_ENTITY_NAME inManagedObjectContext:context];
    
    newBleat.content = contentString;
    newBleat.dateCreated = createdAt;
    newBleat.uniqueID = uniqueID;
    
    return newBleat;
}

@end
