//
//  DentalHealthViewController.h
//  WT_WindsorDental
//
//  Created by Welltime on 19/09/2015.
//  Copyright (c) 2015 Welltime. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PAPasscodeViewController.h"
#import "TextFieldValidator.h"
@interface DentalHealthViewController : UIViewController<PAPasscodeViewControllerDelegate,UIAlertViewDelegate,UITextFieldDelegate>

- (IBAction)next_click:(id)sender;
- (IBAction)home_click:(id)sender;

@property(nonatomic)int* code;
@property(nonatomic)NSString* patient_color;
@property (weak, nonatomic) IBOutlet TextFieldValidator *textfield_email;

@end
