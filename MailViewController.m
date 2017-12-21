//
//  MailViewController.m
//  WT_WindsorDental
//
//  Created by Welltime on 28/03/2016.
//  Copyright © 2016 Welltime. All rights reserved.
//

#import "MailViewController.h"

@interface MailViewController ()

@end

@implementation MailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidAppear:(BOOL)animated {

   
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *mailcontroller = [[MFMailComposeViewController alloc]init];
        NSString *adress = @"stacywright@windsordental.co.uk";
        NSArray *adressArray = [[NSArray alloc]initWithObjects:adress, nil];
        
        
        
        [mailcontroller setMessageBody:self.message isHTML:NO];
        [mailcontroller setToRecipients:adressArray];
        [mailcontroller setSubject:@"Patient Query"];
        mailcontroller.mailComposeDelegate = self;
        
        [self presentViewController:mailcontroller animated:YES completion:NULL];
   // [self dismissViewControllerAnimated:NO completion:nil];
    }
    else{
        UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"No email account found!" message:@"You need to set up your email account in your device before you can send your message." delegate:self  cancelButtonTitle:nil otherButtonTitles:@"OK",nil];
        [alert show];
       
        return;}

}

- (void)mailComposeController:(MFMailComposeViewController*)mailController didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
    NSString *msg1;
    switch (result)
    {
        case MFMailComposeResultCancelled:
            msg1 =@"Email cancelled!";
            break;
        case MFMailComposeResultSaved:
            msg1=@"Message saved!";
            break;
        case MFMailComposeResultSent:
            msg1 =@"Your message has been sent successfully!";
            break;
        case MFMailComposeResultFailed:
            msg1 =@"Message sending failed!";
            break;
        default:
            msg1 =@"Message sending failed!";
            break;
    }
    
    
    
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:
                              @"Alert" message:msg1 delegate:self
                                             cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
    [alertView show];

    
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex != [alertView cancelButtonIndex]) {
        
        
        [self.presentingViewController dismissViewControllerAnimated:NO completion:nil];
       [self.navigationController popToRootViewControllerAnimated:YES];
        
    }
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
