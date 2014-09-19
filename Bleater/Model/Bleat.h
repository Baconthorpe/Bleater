//
//  Bleat.h
//  Bleater
//
//  Created by Ezekiel Abuhoff on 9/19/14.
//  Copyright (c) 2014 Practice. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Bleat : NSManagedObject

@property (nonatomic, retain) NSString * content;
@property (nonatomic, retain) NSDate * dateCreated;
@property (nonatomic, retain) NSString * uniqueID;

@end
