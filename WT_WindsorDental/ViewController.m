//
//  ViewController.m
//  WT_WindsorDental
//
//  Created by Welltime on 15/09/2015.
//  Copyright (c) 2015 Welltime. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "DentalHealthViewController.h"
#import "OffersViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    NSString *scr_width=[NSString stringWithFormat: @"width:%f",screenWidth];
     NSString *scr_height=[NSString stringWithFormat: @"height:%f",screenHeight];
  if (screenWidth<321 && screenHeight<569)
  {
      
      self.windsor_logo.hidden=true;
    
  }
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"dental_health_seague"])
    {
        UITabBarController *tabbar=(UITabBarController*)[segue destinationViewController];
        DentalHealthViewController *vc = (DentalHealthViewController*) [tabbar.viewControllers objectAtIndex:0];
        vc.code=0;
//        DentalHealthViewController *vc=[tabbar.viewControllers objectAtIndex:0];
//        vc.code=1;
        
       
    }
    else if([[segue identifier] isEqualToString:@"treatments_seague"])
    {
        UITabBarController *tabbar=(UITabBarController*)[segue destinationViewController];
        DentalHealthViewController *vc = (DentalHealthViewController*) [tabbar.viewControllers objectAtIndex:0];
        vc.code=1;
        //        DentalHealthViewController *vc=[tabbar.viewControllers objectAtIndex:0];
        //        vc.code=1;
        
        
    }
    else if([[segue identifier] isEqualToString:@"e_consult_seague"])
    {
        UITabBarController *tabbar=(UITabBarController*)[segue destinationViewController];
        DentalHealthViewController *vc = (DentalHealthViewController*) [tabbar.viewControllers objectAtIndex:0];
        vc.code=3;
        //        DentalHealthViewController *vc=[tabbar.viewControllers objectAtIndex:0];
        //        vc.code=1;
        
        
    }
    else if([[segue identifier] isEqualToString:@"appt_seague"])
    {
        UITabBarController *tabbar=(UITabBarController*)[segue destinationViewController];
        DentalHealthViewController *vc = (DentalHealthViewController*) [tabbar.viewControllers objectAtIndex:0];
        vc.code=2;
        //        DentalHealthViewController *vc=[tabbar.viewControllers objectAtIndex:0];
        //        vc.code=1;
        
        
    }
    
    
    else if([[segue identifier] isEqualToString:@"contact_seague"])
    {
        UITabBarController *tabbar=(UITabBarController*)[segue destinationViewController];
        DentalHealthViewController *vc = (DentalHealthViewController*) [tabbar.viewControllers objectAtIndex:0];
        vc.code=4;
        //        DentalHealthViewController *vc=[tabbar.viewControllers objectAtIndex:0];
        //        vc.code=1;
        
        
    }
    
    
}




- (IBAction)offers_click:(id)sender {
    
    OffersViewController *vc = [[OffersViewController alloc]init];
    [self presentViewController:vc animated:YES completion:NULL];
    

}
@end
