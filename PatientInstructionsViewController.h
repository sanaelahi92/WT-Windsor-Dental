//
//  PatientInstructionsViewController.h
//  WT_WindsorDental
//
//  Created by Welltime on 12/10/2015.
//  Copyright © 2015 Welltime. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PatientInstructionsViewController : UIViewController<UIAlertViewDelegate>
@property (strong, nonatomic) NSString *email_addr;
@property (strong, nonatomic) NSString *patient_color_code;
@end
