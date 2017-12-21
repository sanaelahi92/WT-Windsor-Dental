//
//  CosmeticDentistryViewController.m
//  WT_WindsorDental
//
//  Created by Welltime on 29/09/2015.
//  Copyright (c) 2015 Welltime. All rights reserved.
//

#import "CosmeticDentistryViewController.h"
#import "TreatmentsTableViewCell.h"

#import "InvisibleBracesViewController.h"

#import "DermalFillersViewController.h"
#import "TeethWhiteningViewController.h"
#import "PorcelainVeneersViewController.h"
#import "WhiteFillingsViewController.h"
@interface CosmeticDentistryViewController ()

@end

@implementation CosmeticDentistryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.treatmentsList= [[NSMutableArray alloc]initWithObjects:
                          @"Dermal Fillers",@"Teeth Whitening",@"Porcelain Veneers",@"White Fillings",@"Invisible Braces",
                          nil];
    self.treatmentsImageList= [[NSMutableArray alloc]initWithObjects:
                               @"dermal_fillers.png",@"teeth_whitening.png",@"porcelain_veneers.png",@"white_fillings.png",@"invisible_braces.png",
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
    [cell.imageView setContentMode:UIViewContentModeScaleAspectFill];
   
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
    {DermalFillersViewController *vc = [[DermalFillersViewController alloc]init];
        [self presentViewController:vc animated:YES completion:NULL];}
    else if(indexPath.row==1)
    {
        TeethWhiteningViewController *vc = [[TeethWhiteningViewController alloc]init];
        [self presentViewController:vc animated:YES completion:NULL];
        
    }
    else if(indexPath.row==2)
    {
        PorcelainVeneersViewController *vc = [[PorcelainVeneersViewController alloc]init];
        [self presentViewController:vc animated:YES completion:NULL];
        
    }
    else if(indexPath.row==3)
    {
        
        WhiteFillingsViewController *vc = [[WhiteFillingsViewController alloc]init];
        [self presentViewController:vc animated:YES completion:NULL];
    }
    else if(indexPath.row==4)
    {
        
        InvisibleBracesViewController *vc = [[InvisibleBracesViewController alloc]init];
        [self presentViewController:vc animated:YES completion:NULL];
    }
    

}




- (IBAction)back_click:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}
@end
