//
//  ViewController.h
//  WT_WindsorDental
//
//  Created by Welltime on 15/09/2015.
//  Copyright (c) 2015 Welltime. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)offers_click:(id)sender;

- (IBAction)get_in_touch_click:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *dental_health_click;
@property (weak, nonatomic) IBOutlet UIButton *treatments_click;
@property (weak, nonatomic) IBOutlet UIButton *e_consultation_click;
@property (weak, nonatomic) IBOutlet UIButton *make_appt_click;
@property (weak, nonatomic) IBOutlet UIButton *offers_click;
@property (weak, nonatomic) IBOutlet UIButton *get_in_touch_click;
@property (weak, nonatomic) IBOutlet UIImageView *windsor_logo;
- (IBAction)offers_click:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *main_view;


@end

