//
//  CameraViewController.m
//  WT_WindsorDental
//
//  Created by Welltime on 18/09/2015.
//  Copyright (c) 2015 Welltime. All rights reserved.
//

#import "CameraViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface CameraViewController ()

@end

@implementation CameraViewController
AVCaptureSession *session;
AVCaptureStillImageOutput *stillImageOutput;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated{
    @try{
        
        AVCaptureSession *session = [[AVCaptureSession alloc] init];
        session.sessionPreset = AVCaptureSessionPresetPhoto;
        
        AVCaptureVideoPreviewLayer *captureVideoPreviewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:session];
        [captureVideoPreviewLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
        
        captureVideoPreviewLayer.frame = self.frameForCapture.bounds;
        [self.frameForCapture.layer addSublayer:captureVideoPreviewLayer];
        
        UIView *view = [self frameForCapture];
        CALayer *viewLayer = [view layer];
        [viewLayer setMasksToBounds:YES];
        
        CGRect bounds = [view bounds];
        [captureVideoPreviewLayer setFrame:bounds];
        
        NSArray *devices = [AVCaptureDevice devices];
        AVCaptureDevice *frontCamera;
        AVCaptureDevice *backCamera;
        
        for (AVCaptureDevice *device in devices) {
            
            NSLog(@"Device name: %@", [device localizedName]);
            
            if ([device hasMediaType:AVMediaTypeVideo]) {
                
                if ([device position] == AVCaptureDevicePositionBack) {
                    NSLog(@"Device position : back");
                    backCamera = device;
                }
                else {
                    NSLog(@"Device position : front");
                    frontCamera = device;
                }
            }
        }
        
        //    if (!FrontCamera) {
        //        NSError *error = nil;
        //        AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:backCamera error:&amp;error];
        //        if (!input) {
        //            NSLog(@"ERROR: trying to open camera: %@", error);
        //        }
        //        [session addInput:input];
        //    }
        
        //    if (FrontCamera) {
        NSError *error = nil;
        AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:frontCamera error:&error];
        if (!input) {
            NSLog(@"ERROR: trying to open camera: %@", error);
        }
        [session addInput:input];
        //    }
        
        stillImageOutput = [[AVCaptureStillImageOutput alloc] init];
        NSDictionary *outputSettings = [[NSDictionary alloc] initWithObjectsAndKeys: AVVideoCodecJPEG, AVVideoCodecKey, nil];
        [stillImageOutput setOutputSettings:outputSettings];
        
        [session addOutput:stillImageOutput];
        
        [session startRunning];
        
        
    }
    @catch(NSException *e)
    {UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error"
                               
                                                         message:@"This feature is not supported on this device."
                               
                                                        delegate:nil
                               
                                               cancelButtonTitle:@"Ok"
                               
                                               otherButtonTitles:nil];
        
        [alertView show];}
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)show_image:(id)sender {
    AVCaptureConnection *videoConnection=nil;
    for(AVCaptureConnection *connection in stillImageOutput.connections){
        for(AVCaptureInputPort *port in [connection inputPorts])
        { if([[port mediaType] isEqual:AVMediaTypeVideo]){
            videoConnection=connection;
            break;
        }
            
        }
        if(videoConnection)
        {break;}
        
        
        
    }
    
    [stillImageOutput captureStillImageAsynchronouslyFromConnection:videoConnection completionHandler:^(CMSampleBufferRef imageDataSampleBuffer, NSError *error) {
        
        if(imageDataSampleBuffer!=NULL){
            NSData *imageData=[AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageDataSampleBuffer];
            
            Image_Details *im = [Image_Details new];
            
            im.code=self.pic_no;
            
            im.picture=[UIImage imageWithData:imageData];
            
            //            [self dismissViewControllerAnimated:YES completion:nil];
            
            //          presentingViewController
            
            [_delegate sendDataToA:im];
            [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
            
        }
        
        
    }];
    
    

    
}
@end
