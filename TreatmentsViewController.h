//
//  TreatmentsViewController.h
//  WT_WindsorDental
//
//  Created by Welltime on 22/09/2015.
//  Copyright (c) 2015 Welltime. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TreatmentsViewController : UIViewController
- (IBAction)oral_healthcare_click:(id)sender;
- (IBAction)general_dentistry_click:(id)sender;
- (IBAction)cosmetic_dentistry_click:(id)sender;

- (IBAction)replacing_teeth_click:(id)sender;
- (IBAction)home_click:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *treatment_label;

@end
