//
//  PatientInstructionsViewController.m
//  WT_WindsorDental
//
//  Created by Welltime on 12/10/2015.
//  Copyright © 2015 Welltime. All rights reserved.
//

#import "PatientInstructionsViewController.h"
#import "RedContentViewController.h"
#import "AmberContentViewController.h"
#import "GreenContentViewController.h"

@interface PatientInstructionsViewController ()

@end
 UIAlertController  *alert3;
@implementation PatientInstructionsViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidLoad];
    if([self.patient_color_code containsString:@"RED"]){
        
                          [self dismissViewControllerAnimated:YES completion:nil];
                         RedContentViewController *vc = [[RedContentViewController alloc]init];
        
                         [self presentViewController:vc animated:YES completion:NULL];
        
        
        
        
                     }
        
                     else if([self.patient_color_code containsString:@"AMB"]){
        
        
                          [self dismissViewControllerAnimated:YES completion:nil];
                         AmberContentViewController *vc = [[AmberContentViewController alloc]init];
        
                         [self presentViewController:vc animated:YES completion:NULL];
                         
        
                     }
        
                     else if([self.patient_color_code containsString:@"GRE"]){
        
        
                          [self dismissViewControllerAnimated:YES completion:nil];
                         GreenContentViewController *vc = [[GreenContentViewController alloc]init];
                         
                         [self presentViewController:vc animated:YES completion:NULL];
                     
                     }

    
//    alert3 = [UIAlertController alertControllerWithTitle:@"Loading Data \n\n" message:nil preferredStyle:UIAlertControllerStyleAlert];
//    
//    
//    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
//    spinner.center = CGPointMake(130.5, 65.5);
//    spinner.color = [UIColor blackColor];
//    [spinner startAnimating];
//    [alert3.view addSubview:spinner];
//    
//    
//
//    [self presentViewController:alert3 animated:YES completion:nil];
//
//    NSURL *url = [NSURL URLWithString:@"http://ds8223.dedicated.turbodns.co.uk/AppointmentorWebsite/OnlineServices/RestServices.svc/SearchCustomers"];
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
//    [request setHTTPMethod:@"POST"];
//    [request setHTTPShouldHandleCookies:NO];
//    
//    NSDictionary* jsonDictionary2 = [NSDictionary dictionaryWithObjectsAndKeys:@"%",@"CustomerTypeCode",nil];
//    
//    NSDictionary* jsonDictionary1 = [NSDictionary dictionaryWithObjectsAndKeys:
//                                    @"%",@"SurName",
//                                    @"%", @"ForeName",
//                            self.email_addr,@"Email",jsonDictionary2,@"CustomerType",
//                                     
//                                    nil];
//    
//    
//  
//    NSDictionary* jsonDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
//                                    jsonDictionary1,@"customerSearchCriteria",
//                                    @"1", @"source",
//                                    nil];
//    
//    for (id key in jsonDictionary) {
//        NSLog(@"key: %@, value: %@ \n", key, [jsonDictionary objectForKey:key]);
//    }
//    
//    //
//    NSError *error;
//    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:jsonDictionary
//                                                       options:NSJSONWritingPrettyPrinted error:&error];
//    
//    [request setValue:@"Fiddler" forHTTPHeaderField:@"User-Agent"];
//     [request setValue:@"ds8223.dedicated.turbodns.co.uk" forHTTPHeaderField:@"Host"];
//      [request setValue:@"134" forHTTPHeaderField:@"Content-Length"];
//    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//    [request addValue:@"95248be5-ac1d-407d-b3a7-d62a33d31b96" forHTTPHeaderField:@"ClientKey"];
//    
//    //361ba10b-e2b7-46fa-8299-6aed0e401145
//    // 67A844B7-908A-464F-A544-74ED600D7AC3
//    // should check for and handle errors here but we aren't
//    [request setHTTPBody:jsonData];
//    
//   
//    
//    [NSURLConnection sendAsynchronousRequest:request
//                                       queue:[NSOperationQueue mainQueue]
//                           completionHandler:^(NSURLResponse *response,
//                                               NSData *data, NSError *connectionError)
//     {
//         [alert3 dismissViewControllerAnimated:YES completion:nil];
//         if (data.length > 0 && connectionError == nil){
//           
//             
//             NSString *requestReply = [[NSString alloc] initWithBytes:[data bytes] length:[data length] encoding:NSASCIIStringEncoding];
//             NSLog(@"requestReply: %@", requestReply);
//             
//             if(([requestReply containsString:@"404"]|| [requestReply containsString:@"500"]) &&([requestReply containsString:@"<html>"]||[requestReply containsString:@"<HTML>"]||
//                                                                                                 [requestReply containsString:@"<Html>"]                                          ))
//                 
//             {
//                 UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Server error!"
//                                                                  message:@"Sorry, we are experiencing connection issues, please try later."
//                                                                 delegate:self
//                                                        cancelButtonTitle:nil
//                                                        otherButtonTitles:@"OK",nil];
//                 [alert2 show] ;
//                 
//                                 return;}
//
//            
//             NSDictionary *response = [NSJSONSerialization JSONObjectWithData:data
//                                                                      options:0
//                                                                        error:NULL];
//             
//             NSLog(@"response: %@", response);
//            NSString *desc =(NSString *)[[response valueForKeyPath:@"SearchCustomersResult.CustomerType.Description"]componentsJoinedByString:@""];
//             
//             
//            
//            
//             if([desc containsString:@"RED"]){
//                 
//                  [self dismissViewControllerAnimated:YES completion:nil];
//                 RedContentViewController *vc = [[RedContentViewController alloc]init];
//
//                 [self presentViewController:vc animated:YES completion:NULL];
//                 
//                
//
//                 
//             }
//             
//             else if([desc containsString:@"AMB"]){
//                
//                 
//                  [self dismissViewControllerAnimated:YES completion:nil];
//                 AmberContentViewController *vc = [[AmberContentViewController alloc]init];
//                 
//                 [self presentViewController:vc animated:YES completion:NULL];
//             
//             }
//             
//             else if([desc containsString:@"GRE"]){
//                 
//                 
//                  [self dismissViewControllerAnimated:YES completion:nil];
//                 GreenContentViewController *vc = [[GreenContentViewController alloc]init];
//                 
//                 [self presentViewController:vc animated:YES completion:NULL];
//             
//             }
//             
//             else{
//                
//                 
//                              UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Email address not found!"
//                                                                              message:@"Email address is not registered with the practice. Please enter the email address that is already registered with the practice."
//                                                                             delegate:self
//                                                                    cancelButtonTitle:nil
//                                                                    otherButtonTitles:@"OK",nil];
//                              [alert2 show] ;
//                              return;
//             
//             }
//             
//         }
//
//         else
//         {
//             
//             UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Internet connections lost!"
//                                                              message:@"Please check your internet connections and try again. "
//                                                             delegate:self
//                                                    cancelButtonTitle:nil
//                                                    otherButtonTitles:@"OK",nil];
//             [alert2 show] ;
//
//             return;
//         
//         }}];
//    
    
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex != [alertView cancelButtonIndex]) {
        
       
        [self dismissViewControllerAnimated:NO completion:nil];
        [self.navigationController popToRootViewControllerAnimated:YES];
        
       
    }
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

@end
