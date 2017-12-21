//
//  MailViewController.h
//  WT_WindsorDental
//
//  Created by Welltime on 28/03/2016.
//  Copyright © 2016 Welltime. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageUI/MessageUI.h"
@interface MailViewController : UIViewController<MFMailComposeViewControllerDelegate,UIAlertViewDelegate>
@property (strong, nonatomic) NSString *message;
@end
