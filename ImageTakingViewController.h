//
//  ImageTakingViewController.h
//  WT_WindsorDental
//
//  Created by Welltime on 18/09/2015.
//  Copyright (c) 2015 Welltime. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageUI/MessageUI.h"
@interface ImageTakingViewController : UIViewController<MFMailComposeViewControllerDelegate,UIAlertViewDelegate>
@property (weak, nonatomic)UIImage *img_1;
@property (weak, nonatomic)UIImage *img_2;
@property (weak, nonatomic)UIImage *img_3;
@property (weak, nonatomic)UIImage *img_4;
@property(strong,nonatomic) NSString *message;
- (IBAction)pic1_click:(id)sender;
- (IBAction)cancel_click:(id)sender;

- (IBAction)pic2_click:(id)sender;
- (IBAction)pic3_click:(id)sender;
- (IBAction)pic4_click:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *pic1_btn;
@property (weak, nonatomic) IBOutlet UIButton *pic2_btn;
@property (weak, nonatomic) IBOutlet UIButton *pic3_btn;
@property (weak, nonatomic) IBOutlet UIButton *pic4_btn;
@property (weak, nonatomic) IBOutlet UIImageView *im_1;
@property (weak, nonatomic) IBOutlet UIImageView *im_2;
@property (weak, nonatomic) IBOutlet UIImageView *im_3;
@property (weak, nonatomic) IBOutlet UIImageView *im_4;
- (IBAction)send_click:(id)sender;

@end
