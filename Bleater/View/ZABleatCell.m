//
//  ZABleatCell.m
//  Bleater
//
//  Created by Ezekiel Abuhoff on 9/18/14.
//  Copyright (c) 2014 Practice. All rights reserved.
//

#import "ZABleatCell.h"
#import "ZAConstants.h"

@interface ZABleatCell ()

// Bleat Content Label
@property (weak, nonatomic) IBOutlet UILabel *bleatContentLabel;

// Backdrop View
@property (weak, nonatomic) IBOutlet UILabel *backdropView;

@end

@implementation ZABleatCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

// This method sets up a Bleat cell properly with relevant
// details. It should be called whenever a new Bleat cell is being
// made.
- (void) configureForContent:(NSString *)content
{
    self.bleatContentLabel.text = content;
    [self.backdropView.layer setCornerRadius:BLEAT_BACKDROP_CORNER_RADIUS];
}

@end
