//
//  ZAFeedVC.m
//  Bleater
//
//  Created by Ezekiel Abuhoff on 9/18/14.
//  Copyright (c) 2014 Practice. All rights reserved.
//

#import "ZAFeedVC.h"

@interface ZAFeedVC () <UITableViewDataSource, UITableViewDelegate>

// Feed Table
@property (weak, nonatomic) IBOutlet UITableView *feedTable;

// Write Bleat Button
- (IBAction)writeBleatButtonPressed:(id)sender;

@end

@implementation ZAFeedVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

#pragma mark - Actions

- (IBAction)writeBleatButtonPressed:(id)sender
{
    
}
@end
