//
//  ZAFeedVC.m
//  Bleater
//
//  Created by Ezekiel Abuhoff on 9/18/14.
//  Copyright (c) 2014 Practice. All rights reserved.
//

#import "ZAFeedVC.h"
#import "ZAConstants.h"
#import "ZADataStore.h"
#import "ZAManager.h"
#import "Bleat+Methods.h"
#import "ZABleatCell.h"
#import "ZABleatDetailVC.h"
#import <CoreData/CoreData.h>

@interface ZAFeedVC () <UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate>

// Feed Table
@property (weak, nonatomic) IBOutlet UITableView *feedTable;

// Write Bleat Button
- (IBAction)writeBleatButtonPressed:(id)sender;

@end

@implementation ZAFeedVC

#pragma mark - Setup

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpDelegates];
    [self getBleats];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setUpDelegates
{
    self.feedTable.delegate = self;
    self.feedTable.dataSource = self;
    
    [ZADataStore singleton].bleatsFRC.delegate = self;
}

// This method is used as the initial get to update
// local storage with all the Bleats.
- (void) getBleats
{
    [[ZAManager singleton] getAllBleatsAndStoreThemWithSuccess:^(NSDictionary *bleatsDictionary) {
        
    } failure:^(NSString *error) {
        
        UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:ALERT_TITLE message:ALERT_MESSAGE delegate:nil cancelButtonTitle:ALERT_CANCEL otherButtonTitles: nil];
        [errorAlert show];
    }];
}

#pragma mark - Table View Methods

// These methods configure the feed table to populate
// based on the Bleats fetched results controller in
// the data store. It will update the table automatically.

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[ZADataStore singleton].bleatsFRC.sections[section] numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self configureBleatCellForRowAtIndexPath:indexPath];
}

- (ZABleatCell *) configureBleatCellForRowAtIndexPath: (NSIndexPath *)indexPath
{
    ZABleatCell *cell = [self.feedTable dequeueReusableCellWithIdentifier:BLEAT_CELL_IDENTIFIER forIndexPath:indexPath];
    Bleat *bleatInQuestion = [[ZADataStore singleton].bleatsFRC objectAtIndexPath:indexPath];
    [cell configureForContent:bleatInQuestion.content];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.feedTable cellForRowAtIndexPath:indexPath].selected = NO;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return HEIGHT_FOR_FEED_ROW;
}

#pragma mark - Fetched Results Controller Methods

// This is boilerplate for making the fetched results
// controller delegate relationship work.

- (void)controller:(NSFetchedResultsController *)controller
  didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
           atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type
{
    if (type == NSFetchedResultsChangeInsert)
    {
        [self.feedTable insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (type == NSFetchedResultsChangeDelete)
    {
        [self.feedTable deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)controller:(NSFetchedResultsController *)controller
   didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath
     forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath
{
    UITableView *tableView = self.feedTable;
    
    switch(type) {
            
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
            [self configureBleatCellForRowAtIndexPath:indexPath];
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.feedTable endUpdates];
}


- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    [self.feedTable beginUpdates];
}

#pragma mark - Detail View

// This method could later be expanded to address multiple
// segue situations, but for now it focuses on the segue to
// the Bleat detail view controller.
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController class] == [ZABleatDetailVC class])
    {
        ZABleatDetailVC *nextVC = segue.destinationViewController;
        NSIndexPath *indexPathOfSelectedBleat = [self.feedTable indexPathForSelectedRow];
        nextVC.bleat = [[ZADataStore singleton].bleatsFRC objectAtIndexPath:indexPathOfSelectedBleat];
    }
}

@end
