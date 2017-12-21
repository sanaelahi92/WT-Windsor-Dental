//
//  TreatmentsViewController.m
//  WT_WindsorDental
//
//  Created by Welltime on 22/09/2015.
//  Copyright (c) 2015 Welltime. All rights reserved.
//

#import "TreatmentsViewController.h"
#import "OralHealthCareViewController.h"
#import "GeneralDentistryViewController.h"
#import "CosmeticDentistryViewController.h"
#import "ReplacingTeethViewController.h"

@interface TreatmentsViewController ()

@end

@implementation TreatmentsViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    UITabBar *tabBar = self.tabBarController.tabBar;
    UIImage* tabBarBackground = [UIImage imageNamed:@"tab_bak.png"];
    [[UITabBar appearance] setBackgroundImage:tabBarBackground];
    [[UITabBar appearance] setSelectionIndicatorImage:[UIImage imageNamed:@"ind_img3.png"]];
    
    UITabBarController *tabBarController = self.tabBarController;
    
    UITabBarItem *tabBarItem1 = [tabBar.items objectAtIndex:0];
    UITabBarItem *tabBarItem2 = [tabBar.items objectAtIndex:1];
    UITabBarItem *tabBarItem3 = [tabBar.items objectAtIndex:2];
    UITabBarItem *tabBarItem4 = [tabBar.items objectAtIndex:3];
    UITabBarItem *tabBarItem5 = [tabBar.items objectAtIndex:4];
    //    UITabBarItem *tabBarItem6 = [tabBar.items objectAtIndex:5];
    //    tabBarItem1.title = @"Home";
    //    tabBarItem2.title = @"Maps";
    //    tabBarItem3.title = @"My Plan";
    //    tabBarItem4.title = @"Settings";
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor whiteColor] }
                                             forState:UIControlStateSelected];
    
    
    [tabBarItem1 setFinishedSelectedImage:[UIImage imageNamed:@"smile_sel.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"smile_unsel.png"]];
    [tabBarItem2 setFinishedSelectedImage:[UIImage imageNamed:@"tooth_sel.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"teeth_unsel.png"]];
    [tabBarItem3 setFinishedSelectedImage:[UIImage imageNamed:@"cal_sel.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"cal_unsel.png"]];
    
    [tabBarItem4 setFinishedSelectedImage:[UIImage imageNamed:@"econsult_sel.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"econsult_unsel.png"]];
    [tabBarItem5 setFinishedSelectedImage:[UIImage imageNamed:@"env_sel.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"env_unsel.png"]];
    
    //[tabBarItem6 setFinishedSelectedImage:[UIImage imageNamed:@"env_sel.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"env_unsel.png"]];
    
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:17/256.0 green:181/256.0 blue:228/256.0 alpha:1.0]];
    [[UITabBar appearance] setSelectedImageTintColor:[UIColor whiteColor]];
    tabBarController.selectedViewController=[tabBarController.viewControllers objectAtIndex:1];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)oral_healthcare_click:(id)sender {
    OralHealthCareViewController *vc = [[OralHealthCareViewController alloc]init];
    [self presentViewController:vc animated:YES completion:NULL];}


- (IBAction)general_dentistry_click:(id)sender {
    GeneralDentistryViewController *vc = [[GeneralDentistryViewController alloc]init];
    [self presentViewController:vc animated:YES completion:NULL];
}

- (IBAction)cosmetic_dentistry_click:(id)sender {
    CosmeticDentistryViewController *vc = [[CosmeticDentistryViewController alloc]init];
    [self presentViewController:vc animated:YES completion:NULL];
}

- (IBAction)replacing_teeth_click:(id)sender {
    ReplacingTeethViewController *vc = [[ReplacingTeethViewController alloc]init];
    [self presentViewController:vc animated:YES completion:NULL];
}

- (IBAction)home_click:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
    [self.navigationController popToRootViewControllerAnimated:YES];
    

}
@end
