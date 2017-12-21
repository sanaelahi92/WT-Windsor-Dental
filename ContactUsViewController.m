//
//  ContactUsViewController.m
//  WT_WindsorDental
//
//  Created by Welltime on 18/09/2015.
//  Copyright (c) 2015 Welltime. All rights reserved.
//

#import "ContactUsViewController.h"
#import "SalfordViewController.h"
#import "HulmeViewController.h"
#import "ViewController.h"
#import "MailViewController.h"
@interface ContactUsViewController ()

@end

@implementation ContactUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//     self.navigationController.navigationBar.backgroundColor = [UIColor redColor];
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
  
tabBarController.selectedViewController=[tabBarController.viewControllers objectAtIndex:4];
    
    self.txt_name.delegate=self;
    self.txt_phone.delegate=self;
    self.txt_message.delegate=self;
    self.txt_email.delegate=self;
    self.txt_message.editable=YES;
    self.txt_message.layer.borderWidth = 0.5f;
    self.txt_message.layer.borderColor = [[UIColor colorWithRed:189.0f/255.0f
                                                          green:189.0f/255.0f
                                                           blue:189.0f/255.0f
                                                          alpha:0.7f] CGColor];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.myview addGestureRecognizer:tap];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)dismissKeyboard {
    [self.txt_message resignFirstResponder];
    [self.txt_phone resignFirstResponder];
    [self.txt_email resignFirstResponder];
    [self.txt_name resignFirstResponder];
}



- (IBAction)button_click:(id)sender {
    
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:
                              @"Error!" message:@"To proceed, please enter all the details required in the form." delegate:self.view
                                             cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alertView show];

}

- (IBAction)home_click:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

- (IBAction)submit_click:(id)sender {
    
    
    
    
    
    NSString *name=self.txt_name.text;
 
    NSString *phone=self.txt_phone.text;
    NSString *message=self.txt_message.text;
      NSString *email=self.txt_email.text;
    
    if ([name isEqualToString:@""]||[message isEqualToString:@""]||[email isEqualToString:@""])
    {
        
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:
                                  @"Error!" message:@"To proceed, please enter all the details required in the form." delegate:self
                                                 cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        
        [alertView show];
        return;

    }

    
    NSString *msg=@"Name: ";
    msg = [msg stringByAppendingString:name];
    msg = [msg stringByAppendingString:@"\n Phone: "];
    msg = [msg stringByAppendingString:phone];
    msg = [msg stringByAppendingString:@"\n Email: "];
    msg = [msg stringByAppendingString:email];
    msg = [msg stringByAppendingString:@"\n Comments: "];
    msg = [msg stringByAppendingString:message];
    
    MailViewController *vc = [[MailViewController alloc]init];
    vc.message=msg;
    UIViewController *vc2 =self.view.window.rootViewController;
    [vc2 presentViewController: vc animated: YES completion:nil];
   
    
}


- (void)mailComposeController:(MFMailComposeViewController*)mailController didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
    NSString *msg1;
    switch (result)
    { case MFMailComposeResultCancelled:
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
        break;    }
    UIAlertView *mailResuletAlert = [[UIAlertView alloc]initWithFrame:CGRectMake(10, 170, 300, 120)];
    mailResuletAlert.message=msg1;
    mailResuletAlert.title=@"Alert";
    [mailResuletAlert addButtonWithTitle:@"Ok"];
    [mailResuletAlert show];
    
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)salford_click:(id)sender {
    
    SalfordViewController *vc = [[SalfordViewController alloc]init];
    [self presentViewController:vc animated:YES completion:NULL];
    
}

- (IBAction)hulme_click:(id)sender {
    
    HulmeViewController *vc = [[HulmeViewController alloc]init];
    [self presentViewController:vc animated:YES completion:NULL];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    NSCharacterSet *doneButtonCharacterSet = [NSCharacterSet newlineCharacterSet];
    NSRange replacementTextRange = [text rangeOfCharacterFromSet:doneButtonCharacterSet];
    NSUInteger location = replacementTextRange.location;
    
    if (textView.text.length + text.length > 140){
        if (location != NSNotFound){
            [textView resignFirstResponder];
            
        }
        return NO;
    }
    else if (location != NSNotFound){
        [textView resignFirstResponder];
        
        return NO;
    }
    
    return YES;
}

@end
