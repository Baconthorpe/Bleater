//
//  ZAComposeBleatVC.m
//  Bleater
//
//  Created by Ezekiel Abuhoff on 9/18/14.
//  Copyright (c) 2014 Practice. All rights reserved.
//

#import "ZAComposeBleatVC.h"
#import "ZAManager.h"
#import "ZAConstants.h"

@interface ZAComposeBleatVC () <UITextFieldDelegate>

// Back Button
- (IBAction)backButtonPressed:(id)sender;

// Compose Bleat Field
@property (weak, nonatomic) IBOutlet UITextField *composeBleatField;

@end

@implementation ZAComposeBleatVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self basicSetup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) basicSetup
{
    self.composeBleatField.delegate = self;
    
    [self.composeBleatField becomeFirstResponder];
}

#pragma mark - Text Field Delegate Methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];
    
    [[ZAManager singleton] postAndStoreBleatWithContent:textField.text success:^(NSDictionary *confirmationDictionary) {
        
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
        
    } failure:^(NSString *error) {
        
        UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:ALERT_TITLE message:ALERT_MESSAGE delegate:nil cancelButtonTitle:ALERT_CANCEL otherButtonTitles: nil];
        [errorAlert show];
        
        [self dismissViewControllerAnimated:YES completion:^{
            
        }];
        
    }];
    
    return YES;
}

#pragma mark - Actions

// This method deals with user wanting to cancel composition
// of a new Bleat.
- (IBAction)backButtonPressed:(id)sender
{
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
@end
