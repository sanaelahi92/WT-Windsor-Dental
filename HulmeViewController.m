//
//  HulmeViewController.m
//  WT_WindsorDental
//
//  Created by Welltime on 19/09/2015.
//  Copyright (c) 2015 Welltime. All rights reserved.
//

#import "HulmeViewController.h"

@interface HulmeViewController ()

@end

@implementation HulmeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    // Do any additional setup after loading the view from its nib.
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

- (IBAction)hulme_tel_call:(id)sender {
    @try{
        
        NSString *phoneNumber = [@"tel://" stringByAppendingString:@"01617361397"];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
        //        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"tel:01753526301"]];
    }
    @catch (NSException *exception) {
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Sorry..." message:@"This feature is not supported on this device." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
        //	[alert release];
    }

    
}

- (IBAction)hulme_after6_call:(id)sender {
    @try{
        
        NSString *phoneNumber = [@"tel://" stringByAppendingString:@"01613363252"];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
        //        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"tel:01753526301"]];
    }
    @catch (NSException *exception) {
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Sorry..." message:@"This feature is not supported on this device." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
        //	[alert release];
    }

}

- (IBAction)hulme_emergency_call:(id)sender {
    @try{
        
        NSString *phoneNumber = [@"tel://" stringByAppendingString:@"01613372246"];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
        //        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"tel:01753526301"]];
    }
    @catch (NSException *exception) {
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Sorry..." message:@"This feature is not supported on this device." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
        //	[alert release];
    }

}

- (IBAction)back_click:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}
@end
