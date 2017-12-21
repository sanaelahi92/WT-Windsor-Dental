//
//  CameraViewController.h
//  WT_WindsorDental
//
//  Created by Welltime on 18/09/2015.
//  Copyright (c) 2015 Welltime. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Image_Details.h"
@protocol senddataProtocol <NSObject>

-(void)sendDataToA:(Image_Details *)details; //I am thinking my data is NSArray, you can use another object for store your information.

@end
@interface CameraViewController : UIViewController
@property(nonatomic,assign)id delegate;
@property(nonatomic,assign)UIImage* cap_img;
//@property(nonatomic,assign)Image_Details* im;
@property(nonatomic,assign)NSString* pic_no;
@property (weak, nonatomic) IBOutlet UIView *frameForCapture;
- (IBAction)show_image:(id)sender;


@end
