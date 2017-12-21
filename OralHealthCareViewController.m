//
//  OralHealthCareViewController.m
//  WT_WindsorDental
//
//  Created by Welltime on 28/09/2015.
//  Copyright (c) 2015 Welltime. All rights reserved.
//

#import "OralHealthCareViewController.h"
#import "DentalHygieneViewController.h"
#import "PregnancyDentalCareViewController.h"
#import "ChidrenTeethViewController.h"
#import "PreventingOralCancerViewController.h"
#import "SensitiveTeethViewController.h"
@interface OralHealthCareViewController ()

@end

@implementation OralHealthCareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.treatmentsList= [[NSMutableArray alloc]initWithObjects:
                        @"Dental Hygiene",@"Children's Teeth",@"Preventing Oral Cancer",@"Sensitive Teeth",@"Pregnancy Dental Care",
                        nil];
    self.treatmentsImageList= [[NSMutableArray alloc]initWithObjects:
                          @"dental_hygiene.png",@"children_teeth_img.png",@"preventing_oral_cancer_img.png",@"sensitive_teeth_img.png",@"pregnancy_dental_care.png",
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
    {DentalHygieneViewController *vc = [[DentalHygieneViewController alloc]init];
        [self presentViewController:vc animated:YES completion:NULL];}
    else if(indexPath.row==1)
    {
        ChidrenTeethViewController *vc = [[ChidrenTeethViewController alloc]init];
        [self presentViewController:vc animated:YES completion:NULL];
        
    }
    else if(indexPath.row==2)
    {
        PreventingOralCancerViewController *vc = [[PreventingOralCancerViewController alloc]init];
        [self presentViewController:vc animated:YES completion:NULL];
        
    }
    else if(indexPath.row==3)
    {
        
        SensitiveTeethViewController *vc = [[SensitiveTeethViewController alloc]init];
        [self presentViewController:vc animated:YES completion:NULL];
    }
    else if(indexPath.row==4)
    {
        
        PregnancyDentalCareViewController *vc = [[PregnancyDentalCareViewController alloc]init];
        [self presentViewController:vc animated:YES completion:NULL];
    }


}





- (IBAction)back_click:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}
@end
