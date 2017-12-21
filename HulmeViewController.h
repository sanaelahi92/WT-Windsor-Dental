//
//  HulmeViewController.h
//  WT_WindsorDental
//
//  Created by Welltime on 19/09/2015.
//  Copyright (c) 2015 Welltime. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HulmeViewController : UIViewController

- (IBAction)hulme_tel_call:(id)sender;
- (IBAction)hulme_after6_call:(id)sender;
- (IBAction)hulme_emergency_call:(id)sender;
- (IBAction)back_click:(id)sender;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *navbar_back_button;
@property (weak, nonatomic) IBOutlet UINavigationBar *nav_bar;

@end
