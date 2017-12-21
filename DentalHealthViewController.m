//
//  DentalHealthViewController.m
//  WT_WindsorDental
//
//  Created by Welltime on 19/09/2015.
//  Copyright (c) 2015 Welltime. All rights reserved.
//

#import "DentalHealthViewController.h"
#import "PatientInstructionsViewController.h"

@interface DentalHealthViewController ()

@end
UIAlertController  *main_alert;
@implementation DentalHealthViewController

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
    
    tabBarController.selectedViewController=[tabBarController.viewControllers objectAtIndex:0];
    
    
    ///////
    
}
-(void)viewWillAppear:(BOOL)animated{
    int index=self.code;
    self.code=0;
    
    [self.tabBarController setSelectedIndex:index];
    
    
}
- (void)viewDidAppear:(BOOL)animated{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)validateEmailWithString:(NSString*)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

- (IBAction)next_click:(id)sender {
    
    
    //    PAPasscodeViewController *passcodeViewController = [[PAPasscodeViewController alloc] initForAction:PasscodeActionEnter];
    //    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
    //        passcodeViewController.backgroundView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    //    }
    //
    //
    //
    //    passcodeViewController.delegate = self;
    //
    //    NSString* passcode=[[NSUserDefaults standardUserDefaults] objectForKey:@"CODE"];
    //    passcodeViewController.passcode = passcode;
    //    passcodeViewController.alternativePasscode = @"7920";
    //
    //
    //
    //    [self presentViewController:[[UINavigationController alloc] initWithRootViewController:passcodeViewController] animated:YES completion:nil];
    
    // *******************************************
    
    
    
    
    if(![self validateEmailWithString:self.textfield_email.text])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid email ID!" message:@"Please enter a valid email address." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
        
        return ;}
    
    
    main_alert = [UIAlertController alertControllerWithTitle:@"Processing... \n\n" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    spinner.center = CGPointMake(130.5, 65.5);
    spinner.color = [UIColor blackColor];
    [spinner startAnimating];
    [main_alert.view addSubview:spinner];
    
    
    [self presentViewController:main_alert animated:YES completion:nil];
    
    
    
    ///////////////
    
    NSURL *url = [NSURL URLWithString:@"http://ds8223.dedicated.turbodns.co.uk/AppointmentorWebsite/OnlineServices/RestServices.svc/SearchCustomers"];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    [request setHTTPMethod:@"POST"];
    [request setHTTPShouldHandleCookies:NO];
    
    NSDictionary* jsonDictionary2 = [NSDictionary dictionaryWithObjectsAndKeys:@"%",@"CustomerTypeCode",nil];
    
    NSDictionary* jsonDictionary1 = [NSDictionary dictionaryWithObjectsAndKeys:
                                     @"%",@"SurName",
                                     @"%", @"ForeName",
                                     self.textfield_email.text,@"Email",jsonDictionary2,@"CustomerType",
                                     
                                     nil];
    
    
    
    NSDictionary* jsonDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                    jsonDictionary1,@"customerSearchCriteria",
                                    @"1", @"source",
                                    nil];
    
    for (id key in jsonDictionary) {
        NSLog(@"key: %@, value: %@ \n", key, [jsonDictionary objectForKey:key]);
    }
    
    //
    NSError *error;
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:jsonDictionary
                                                       options:NSJSONWritingPrettyPrinted error:&error];
    
//    [request setValue:@"Fiddler" forHTTPHeaderField:@"User-Agent"];
    [request setValue:@"ds8223.dedicated.turbodns.co.uk" forHTTPHeaderField:@"Host"];
    [request setValue:@"134" forHTTPHeaderField:@"Content-Length"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"95248be5-ac1d-407d-b3a7-d62a33d31b96" forHTTPHeaderField:@"ClientKey"];
    
    //361ba10b-e2b7-46fa-8299-6aed0e401145
    // 67A844B7-908A-464F-A544-74ED600D7AC3
    // should check for and handle errors here but we aren't
    [request setHTTPBody:jsonData];
    
    
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response,
                                               NSData *data, NSError *connectionError)
     {
         
         if (data.length > 0 && connectionError == nil){
             
             
             NSString *requestReply = [[NSString alloc] initWithBytes:[data bytes] length:[data length] encoding:NSASCIIStringEncoding];
             NSLog(@"requestReply: %@", requestReply);
             
             if(([requestReply containsString:@"404"]|| [requestReply containsString:@"500"]) &&([requestReply containsString:@"<html>"]||[requestReply containsString:@"<HTML>"]||
                                                                                                 [requestReply containsString:@"<Html>"]                                          ))
                 
             {[main_alert dismissViewControllerAnimated:YES completion:nil];
                 UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Server error!"
                                                                  message:@"Sorry, we are experiencing connection issues, please try later."
                                                                 delegate:self
                                                        cancelButtonTitle:nil
                                                        otherButtonTitles:@"OK",nil];
                 [alert2 show] ;
                 
                 return;}
             
             
             NSDictionary *response = [NSJSONSerialization JSONObjectWithData:data
                                                                      options:0
                                                                        error:NULL];
             
             NSLog(@"response: %@", response);
             NSString *desc =(NSString *)[[response valueForKeyPath:@"SearchCustomersResult.CustomerType.Description"]componentsJoinedByString:@""];
             
             
             
             
             if([desc containsString:@"RED"]){
                 
                 self.patient_color=@"RED";
                 
                 [self sendMail];
                 
             }
             
             else if([desc containsString:@"AMB"]){
                 
                 
                 self.patient_color=@"AMB";
                 [self sendMail];
             }
             
             else if([desc containsString:@"GRE"]){
                 
                 
                 self.patient_color=@"GRE";
                 [self sendMail];
                 
             }
             
             else{[main_alert dismissViewControllerAnimated:YES completion:nil];
                 
                 UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Email address not found!"
                                                                  message:@"Email address is not registered with the practice. Please enter the email address that is already registered with the practice."
                                                                 delegate:self
                                                        cancelButtonTitle:nil
                                                        otherButtonTitles:@"OK",nil];
                 [alert2 show] ;
                 return;
                 
             }
             
         }
         
         else
         {[main_alert dismissViewControllerAnimated:YES completion:nil];
             
             UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Internet connections lost!"
                                                              message:@"Please check your internet connections and try again. "
                                                             delegate:self
                                                    cancelButtonTitle:nil
                                                    otherButtonTitles:@"OK",nil];
             [alert2 show] ;
             
             return;
             
         }}];
    
}

    
    
    ///////////////
    
    - (void) sendMail {
        int number = rand() % 9000 + 1000;
        NSString *code = [NSString stringWithFormat:@"%d", number];
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        [defaults setObject:code forKey:@"CODE"];
    NSURL *url2 = [NSURL URLWithString:@"http://ds8243.dedicated.webfusion.co.uk/ReferralTracking/api/windsormail"];
    NSMutableURLRequest *request2 = [[NSMutableURLRequest alloc] initWithURL:url2];
    [request2 setHTTPMethod:@"POST"];
    [request2 setHTTPShouldHandleCookies:NO];
    NSString *post_req=[@"email_address= " stringByAppendingString:self.textfield_email.text];
    post_req=[post_req stringByAppendingString:@"&code="];
    post_req=[post_req stringByAppendingString:code];
    
    NSData *postData = [post_req dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    
    NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
    // [request setHTTPBody:jsonData];
    
    [request2 setValue:postLength forHTTPHeaderField:@"Content-Length"]; [request2 setHTTPBody:postData];
    
    [NSURLConnection sendAsynchronousRequest:request2
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response,
                                               NSData *data, NSError *connectionError)
     {[main_alert dismissViewControllerAnimated:YES completion:nil];
         if (data.length > 0 && connectionError == nil){
             
             NSString *requestReply = [[NSString alloc] initWithBytes:[data bytes] length:[data length] encoding:NSASCIIStringEncoding];
             NSLog(@"requestReply: %@", requestReply);
             
             if(([requestReply containsString:@"404"]|| [requestReply containsString:@"500"]) &&([requestReply containsString:@"<html>"]||[requestReply containsString:@"<HTML>"]||
                                                                                                 [requestReply containsString:@"<Html>"]                                          ))
                 
             {                  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Server error!"
                                                                 message:@"Sorry, we are experiencing connection issues, please try later."
                                                                delegate:self
                                                       cancelButtonTitle:@"OK"
                                                       otherButtonTitles:nil,nil];
                 alert.delegate=self;
                 [alert show] ;
                 return;}
             else if([requestReply containsString:@"true"])
             {   NSString *msg=[@"Please enter the code already sent to " stringByAppendingString:self.textfield_email.text];
                 
                 
                 UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Code sent!"
                                                                 message:msg
                                                                delegate:self
                                                       cancelButtonTitle:nil
                                                       otherButtonTitles:@"Ok",nil];
                 alert.tag = 100;
                 alert.delegate=self;
                 
                 [alert show] ;
                 return;
                 
                 
                 
                 
                 
             }
             
             else{
                 
                 UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Server error!"
                                                                 message:@"Sorry, we are experiencing connection issues, please try later."
                                                                delegate:self
                                                       cancelButtonTitle:@"OK"
                                                       otherButtonTitles:nil,nil];
                 alert.delegate=self;
                 [alert show] ;
                 
                 return;
                 
             }
             
             
             
             
         }
         else{
             
             UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Internet connections lost!"
                                                             message:@"Please check your internet connections and try again."
                                                            delegate:self
                                                   cancelButtonTitle:@"Ok"
                                                   otherButtonTitles:nil,nil];
             
             [alert show] ;
             
             
             return;
             
         }
         
         
     }];
    
    //////////////
    
    
}


- (IBAction)home_click:(id)sender {
    
    
    [self dismissViewControllerAnimated:NO completion:nil];
    [self.navigationController popToRootViewControllerAnimated:YES];
    
    
}

#pragma mark - PAPasscodeViewControllerDelegate

- (void)PAPasscodeViewControllerDidCancel:(PAPasscodeViewController *)controller {
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex != [alertView cancelButtonIndex]) {
        
        if (alertView.tag == 100) {
            
            PAPasscodeViewController *passcodeViewController = [[PAPasscodeViewController alloc] initForAction:PasscodeActionEnter];
            if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
                passcodeViewController.backgroundView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
            }
            
            
            
            passcodeViewController.delegate = self;
            
            NSString* passcode=[[NSUserDefaults standardUserDefaults] objectForKey:@"CODE"];
            passcodeViewController.passcode = passcode;
            passcodeViewController.alternativePasscode = @"7920";
            
            
            
            [self presentViewController:[[UINavigationController alloc] initWithRootViewController:passcodeViewController] animated:YES completion:nil];
        }
        //        NSLog(@"Launching the store");
        //        [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
        
        //replace appname with any specific name you want
    }
}



- (void)PAPasscodeViewControllerDidEnterPasscode:(PAPasscodeViewController *)controller {
    [self dismissViewControllerAnimated:YES completion:^() {
        
        
        PatientInstructionsViewController *vc = [[PatientInstructionsViewController alloc]init];
        vc.email_addr=self.textfield_email.text;
        vc.patient_color_code=self.patient_color;
        [self presentViewController:vc animated:YES completion:NULL];
        
        //        [[[UIAlertView alloc] initWithTitle:nil message:@"Passcode entered correctly" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }];
}
- (void)PAPasscodeViewController:(PAPasscodeViewController *)controller didFailToEnterPasscode:(NSInteger)attempts
{
    if(attempts>4)
    { [self dismissViewControllerAnimated:NO completion:nil];}
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

@end
