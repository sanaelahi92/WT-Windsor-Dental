//
//  CodeVerificationViewController.m
//  WT_WindsorDental
//
//  Created by Welltime on 05/10/2015.
//  Copyright © 2015 Welltime. All rights reserved.
//

#import "CodeVerificationViewController.h"
#import "PatientInstructionsViewController.h"
@interface CodeVerificationViewController ()

@end

@implementation CodeVerificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    PAPasscodeViewController *passcodeViewController = [[PAPasscodeViewController alloc] initForAction:PasscodeActionEnter];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        passcodeViewController.backgroundView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    }
    
    passcodeViewController.delegate = self;
   
    NSString* passcode=[[NSUserDefaults standardUserDefaults] objectForKey:@"CODE"];
    passcodeViewController.passcode = passcode;
   // passcodeViewController.alternativePasscode = @"5678";
   
    
    [self presentViewController:[[UINavigationController alloc] initWithRootViewController:passcodeViewController] animated:YES completion:nil];


    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - PAPasscodeViewControllerDelegate

- (void)PAPasscodeViewControllerDidCancel:(PAPasscodeViewController *)controller {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)PAPasscodeViewControllerDidEnterPasscode:(PAPasscodeViewController *)controller {
    [self dismissViewControllerAnimated:YES completion:^() {
        PatientInstructionsViewController *vc = [[PatientInstructionsViewController alloc]init];
        vc.email_addr=@"";
        [self presentViewController:vc animated:YES completion:NULL];
        
  
    }];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
