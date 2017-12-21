//
//  E-ConsultViewController.h
//  WT_WindsorDental
//
//  Created by Welltime on 18/09/2015.
//  Copyright (c) 2015 Welltime. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GCPlaceholderTextView.h"
#import "TextFieldValidator.h"

#import "IHKeyboardAvoiding.h"
@interface E_ConsultViewController : UIViewController <UITextFieldDelegate,UITextViewDelegate>
@property (weak, nonatomic) IBOutlet TextFieldValidator *txt_name;



@property (weak, nonatomic) IBOutlet TextFieldValidator *txt_last_name;

@property (weak, nonatomic) IBOutlet TextFieldValidator *txt_phone;

@property (weak, nonatomic) IBOutlet UIView *form_view;

@property (weak, nonatomic) IBOutlet UIView *comment_view;


@property (weak, nonatomic) IBOutlet GCPlaceholderTextView *tv_comments;

- (IBAction)home_click:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *myView;

@end
