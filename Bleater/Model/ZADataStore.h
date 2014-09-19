//
//  ZADataStore.h
//  Bleater
//
//  Created by Ezekiel Abuhoff on 9/18/14.
//  Copyright (c) 2014 Practice. All rights reserved.
//

// DATA STORE
//
// This class manages the data stored on the device. It saves
// and retrieves data.

#import <Foundation/Foundation.h>

@class NSManagedObjectContext;
@class NSManagedObjectModel;
@class NSPersistentStoreCoordinator;
@class NSFetchedResultsController;

@interface ZADataStore : NSObject

// Core Data Related Properties
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

// Fetched Results Controller
@property (strong, nonatomic, readonly) NSFetchedResultsController *bleatsFRC;

// Singleton Method
+ (instancetype) singleton;

// Core Data Related Methods
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

// Duplicate Check
- (BOOL) contextHasBleatOfUniqueID: (NSString *)uniqueID;

@end
