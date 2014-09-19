//
//  ZABleatDetailVC.h
//  Bleater
//
//  Created by Ezekiel Abuhoff on 9/18/14.
//  Copyright (c) 2014 Practice. All rights reserved.
//

//  BLEAT DETAIL VIEW CONTROLLER
//
//  This view controller gives the user a closer look
//  at an individual Bleat.

#import <UIKit/UIKit.h>

@class Bleat;

@interface ZABleatDetailVC : UIViewController

@property (strong, nonatomic) Bleat *bleat;

@end
