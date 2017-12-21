//
//  BridgesViewController.m
//  WT_WindsorDental
//
//  Created by Welltime on 04/10/2015.
//  Copyright © 2015 Welltime. All rights reserved.
//

#import "BridgesViewController.h"

@interface BridgesViewController ()

@end

@implementation BridgesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

- (IBAction)back_click:(id)sender {
    
        [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}
@end
