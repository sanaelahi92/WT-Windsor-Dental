//
//  RedContentViewController.h
//  WT_WindsorDental
//
//  Created by Welltime on 12/12/2015.
//  Copyright © 2015 Welltime. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol senddataProtocol <NSObject>

-(void)sendDataToA; //I am thinking my data is NSArray, you can use another object for store your information.

@end
@interface RedContentViewController : UIViewController

- (IBAction)back_click:(id)sender;
@property(nonatomic,assign)id delegate;

@end
