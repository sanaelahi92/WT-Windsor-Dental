//
//  CosmeticDentistryViewController.h
//  WT_WindsorDental
//
//  Created by Welltime on 29/09/2015.
//  Copyright (c) 2015 Welltime. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CosmeticDentistryViewController : UIViewController
@property (strong, nonatomic) NSMutableArray  *treatmentsList;
@property (strong, nonatomic) NSMutableArray  *treatmentsImageList;
- (IBAction)back_click:(id)sender;

@end
