//
//  ZABleatDetailVC.m
//  Bleater
//
//  Created by Ezekiel Abuhoff on 9/18/14.
//  Copyright (c) 2014 Practice. All rights reserved.
//

#import "ZABleatDetailVC.h"
#import "Bleat+Methods.h"

@interface ZABleatDetailVC ()

// Bleat Content Label
@property (weak, nonatomic) IBOutlet UILabel *bleatContentLabel;

@end

@implementation ZABleatDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpAppearance];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setUpAppearance
{
    self.bleatContentLabel.text = self.bleat.content;
}

@end
