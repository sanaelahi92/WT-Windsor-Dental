//
//  ContactUsViewController.h
//  WT_WindsorDental
//
//  Created by Welltime on 18/09/2015.
//  Copyright (c) 2015 Welltime. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GCPlaceholderTextView.h"
#import "MessageUI/MessageUI.h"
@interface ContactUsViewController : UIViewController
<UITextFieldDelegate,UITextViewDelegate,MFMailComposeViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txt_name;
@property (weak, nonatomic) IBOutlet UITextField *txt_email;

@property (weak, nonatomic) IBOutlet GCPlaceholderTextView *myView;


@property (weak, nonatomic) IBOutlet UITextField *txt_phone;
@property (weak, nonatomic) IBOutlet GCPlaceholderTextView *txt_message;

@property (strong, nonatomic) IBOutlet UIView *myview;

- (IBAction)button_click:(id)sender;

- (IBAction)home_click:(id)sender;
- (IBAction)submit_click:(id)sender;

- (IBAction)salford_click:(id)sender;
- (IBAction)hulme_click:(id)sender;

@end
