//
//  GeneralDentistryViewController.m
//  WT_WindsorDental
//
//  Created by Welltime on 29/09/2015.
//  Copyright (c) 2015 Welltime. All rights reserved.
//

#import "GeneralDentistryViewController.h"
#import "TreatmentsTableViewCell.h"
#import "ToothExtractionsViewController.h"
#import "JawProblemsViewController.h"
#import "EmergencyDentalCareViewController.h"
#import "RootCanalViewController.h"
@interface GeneralDentistryViewController ()

@end

@implementation GeneralDentistryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.treatmentsList= [[NSMutableArray alloc]initWithObjects:
                          @"Tooth Extractions",@"Jaw Pain",@"Emergency Dental Care",@"Root Canal Therapy",
                          nil];
    self.treatmentsImageList= [[NSMutableArray alloc]initWithObjects:
                               @"tooth_extractions.png",@"jaw_pain.png",@"emergency_dental_care.png",@"root_canal_therapy.png",
                               nil];
// Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.treatmentsList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"TreatmentsTableViewCell";
    
    TreatmentsTableViewCell *cell = (TreatmentsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TreatmentsTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
        
        
    }
    
    cell.label.text = [self.treatmentsList
                       objectAtIndex:indexPath.row];
    
    
    UIImage *picture = [UIImage imageNamed:[self.treatmentsImageList objectAtIndex:indexPath.row]];
    
    [cell.imageView setImage:picture];
    return cell;
}

-(void)indexAction:(id)sender
{
    //    NSInteger *tid = ((UIControl *) sender).tag;
    //    NSLog(@"buttonTag: %i", tid);
}


#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   if(indexPath.row==0)
   {ToothExtractionsViewController *vc = [[ToothExtractionsViewController alloc]init];
       [self presentViewController:vc animated:YES completion:NULL];}
    else if(indexPath.row==1)
    {
        JawProblemsViewController *vc = [[JawProblemsViewController alloc]init];
        [self presentViewController:vc animated:YES completion:NULL];
    
    }
    else if(indexPath.row==2)
    {
        EmergencyDentalCareViewController *vc = [[EmergencyDentalCareViewController alloc]init];
        [self presentViewController:vc animated:YES completion:NULL];

    }
    else if(indexPath.row==3)
    {
    
        RootCanalViewController *vc = [[RootCanalViewController alloc]init];
        [self presentViewController:vc animated:YES completion:NULL];
    }
    
  }





- (IBAction)back_click:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}
@end
