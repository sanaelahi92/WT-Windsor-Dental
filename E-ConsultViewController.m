//
//  E-ConsultViewController.m
//  WT_WindsorDental
//
//  Created by Welltime on 18/09/2015.
//  Copyright (c) 2015 Welltime. All rights reserved.
//

#import "E-ConsultViewController.h"
#import "ImageTakingViewController.h"
@interface E_ConsultViewController ()

@end

@implementation E_ConsultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
[IHKeyboardAvoiding setAvoidingView:self.form_view];
    
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
    tabBarController.selectedViewController=[tabBarController.viewControllers objectAtIndex:3];
    
    self.txt_name.delegate=self;
    
    self.txt_phone.delegate=self;
    self.txt_last_name.delegate=self;
    
//    [self.txt_last_name addRegx:@"[A-Za-z]{3,20}" withMsg:@"Name should be a character."];
//    [self.txt_name addRegx:@"[A-Za-z]{3,20}" withMsg:@"Name should be a character."];
//        [self.txt_phone addRegx:@"[0-9]{3}\\-[0-9]{3}\\-[0-9]{4}" withMsg:@"Phone number must be in proper format (eg. ###-###-####)"];
    
    self.tv_comments.delegate=self;
    self.tv_comments.editable=YES;
    self.tv_comments.layer.borderWidth = 0.5f;
    self.tv_comments.layer.borderColor = [[UIColor colorWithRed:189.0f/255.0f
                                                          green:189.0f/255.0f
                                                           blue:189.0f/255.0f
                                                          alpha:0.7f] CGColor];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.myView addGestureRecognizer:tap];

    // Do any additional setup after loading the view.
}

-(void)dismissKeyboard {
    [self.tv_comments resignFirstResponder];
    [self.txt_name resignFirstResponder];
    [self.txt_phone resignFirstResponder];
    [self.txt_last_name resignFirstResponder];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)next_click:(id)sender {
    
   
    NSString *first_name=self.txt_name.text;
NSString *last_name=self.txt_last_name.text;
    NSString *phone=self.txt_phone.text;
    NSString *comments=self.tv_comments.text;
    
    if ([first_name isEqualToString:@""]||[last_name isEqualToString:@""]||[comments isEqualToString:@""])
    {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:
                                  @"Error!" message:@"To proceed, please enter all the details required in the form. " delegate:self
                                                 cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alertView show];
        return;
    }
    
    NSString *msg=@"Name: ";
    msg = [msg stringByAppendingString:first_name];
    msg = [msg stringByAppendingString:@" "];
    msg = [msg stringByAppendingString:last_name];
    msg = [msg stringByAppendingString:@"\n Phone:"];
    msg = [msg stringByAppendingString:phone];
    msg = [msg stringByAppendingString:@"\n Comments:"];
    msg = [msg stringByAppendingString:comments];
    
   
    ImageTakingViewController *vc = [[ImageTakingViewController alloc]init];
    vc.message=msg;
    [self presentViewController:vc animated:YES completion:nil];
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

////////// ************** textView Methods *************/////////////
//- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
//    NSLog(@"textViewShouldBeginEditing:");
//    return YES;
//}
//
//- (void)textViewDidBeginEditing:(UITextView *)textView {
//    NSLog(@"textViewDidBeginEditing:");
//    textView.backgroundColor = [UIColor whiteColor];
//}
//
//- (BOOL)textViewShouldEndEditing:(UITextView *)textView{
//    NSLog(@"textViewShouldEndEditing:");
//    textView.backgroundColor = [UIColor whiteColor];
//    return YES;
//}
//
//- (void)textViewDidEndEditing:(UITextView *)textView{
//    NSLog(@"textViewDidEndEditing:");
//    
//}
//
//- (void)textViewDidChange:(UITextView *)textView{
//    NSLog(@"textViewDidChange:");
//    
//}
//
//- (void)textViewDidChangeSelection:(UITextView *)textView{
//    NSLog(@"textViewDidChangeSelection:");
//}

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



- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

- (IBAction)home_click:(id)sender {
    
    [self dismissViewControllerAnimated:NO completion:nil];
    [self.navigationController popToRootViewControllerAnimated:YES];
    

    
}
@end
