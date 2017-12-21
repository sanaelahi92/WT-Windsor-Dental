//
//  ImageTakingViewController.m
//  WT_WindsorDental
//
//  Created by Welltime on 18/09/2015.
//  Copyright (c) 2015 Welltime. All rights reserved.
//

#import "ImageTakingViewController.h"
#import "Image_Details.h"
#import "CameraViewController.h"
@interface ImageTakingViewController ()

@end

@implementation ImageTakingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.im_1 setHidden:YES];
    [self.im_2 setHidden:YES];
    [self.im_3 setHidden:YES];
    [self.im_4 setHidden:YES];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)sendDataToA:(Image_Details *)details
{
    if([details.code containsString:@"1"])
    {[self.im_1 setImage:details.picture];
        
        [self.im_1 setHidden:NO];
        //        [self.pic1_btn setImage:details.picture forState:UIControlStateNormal];
        self.img_1=details.picture;
        
    }
    
    else if([details.code containsString:@"2"])
    {[self.im_2 setImage:details.picture];
        [self.im_2 setHidden:NO];
        self.img_2=details.picture;}
    
    else if([details.code containsString:@"3"])
    {[self.im_3 setImage:details.picture];
        [self.im_3 setHidden:NO];
        self.img_3=details.picture;
    }
    
    else if([details.code containsString:@"4"])
    {[self.im_4 setImage:details.picture];
        self.img_4=details.picture;
        [self.im_4 setHidden:NO];
    }
    
    // data will come here inside of ViewControllerA
}

- (IBAction)pic1_click:(id)sender {
    CameraViewController *vc= [[CameraViewController alloc] init];
    vc.pic_no=@"1";
    [vc setDelegate:self];
    [self presentViewController:vc animated:YES completion:nil];

}

- (IBAction)cancel_click:(id)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (IBAction)pic2_click:(id)sender {
    CameraViewController *vc= [[CameraViewController alloc] init];
    vc.pic_no=@"2";
    [vc setDelegate:self];
    [self presentViewController:vc animated:YES completion:nil];

}

- (IBAction)pic3_click:(id)sender {
    CameraViewController *vc= [[CameraViewController alloc] init];
    vc.pic_no=@"3";
    [vc setDelegate:self];
    [self presentViewController:vc animated:YES completion:nil];

}

- (IBAction)pic4_click:(id)sender {
    CameraViewController *vc= [[CameraViewController alloc] init];
    vc.pic_no=@"4";
    [vc setDelegate:self];
    [self presentViewController:vc animated:YES completion:nil];
}
//-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
//{ [self dismissViewControllerAnimated:YES completion:nil];}

- (IBAction)send_click:(id)sender {
    
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *mailcontroller = [[MFMailComposeViewController alloc]init];mailcontroller.mailComposeDelegate = self;
        
        //[mailcontroller setMailComposeDelegate:self];
        NSString *adress = @"stacywright@windsordental.co.uk";
        NSArray *adressArray = [[NSArray alloc]initWithObjects:adress, nil];
        
        if(self.img_1!=nil)
        {
            NSData *imageData_1 = UIImagePNGRepresentation(self.img_1);
            [mailcontroller addAttachmentData:imageData_1 mimeType:@"image/png" fileName:@"Attachment_1"];}
        if(self.img_2!=nil)
        {
            NSData *imageData_2 = UIImagePNGRepresentation(self.img_2);
            [mailcontroller addAttachmentData:imageData_2 mimeType:@"image/png" fileName:@"Attachment_2"];}
        if(self.img_3!=nil)
        {
            NSData *imageData_3 = UIImagePNGRepresentation(self.img_3);
            [mailcontroller addAttachmentData:imageData_3 mimeType:@"image/png" fileName:@"Attachment_3"];}
        if(self.img_4!=nil)
        {
            NSData *imageData_4 = UIImagePNGRepresentation(self.img_4);
            [mailcontroller addAttachmentData:imageData_4 mimeType:@"image/png" fileName:@"Attachment_4"];}
        
        
        [mailcontroller setMessageBody:self.message isHTML:NO];
        [mailcontroller setToRecipients:adressArray];
        [mailcontroller setSubject:@"Online Dental Consultation"];
        
        [self presentViewController:mailcontroller animated:YES completion:NULL];}
    
    else
    {UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"No email account found!" message:@"You need to set up your email account in your device before you can send your message." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK",nil];
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
        break;    }
    
    
    UIAlertView *mailResuletAlert = [[UIAlertView alloc]initWithFrame:CGRectMake(10, 170, 300, 120)];
    mailResuletAlert.message=msg1;
    mailResuletAlert.title=@"Alert";
    mailResuletAlert.delegate=self;
    [mailResuletAlert addButtonWithTitle:@"OK"];
    [mailResuletAlert show];
    
    
    
    [self dismissModalViewControllerAnimated:YES];
    
    
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex != [alertView cancelButtonIndex]) {
         [self dismissModalViewControllerAnimated:YES];
     
       //[self dismissViewControllerAnimated:NO completion:nil];
        [self.navigationController popToRootViewControllerAnimated:YES];
        
        
    }
}


@end
