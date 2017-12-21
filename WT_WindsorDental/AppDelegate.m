//
//  AppDelegate.m
//  WT_WindsorDental
//
//  Created by Welltime on 15/09/2015.
//  Copyright (c) 2015 Welltime. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
   
    if([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
        
    { UIUserNotificationType types = UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
        UIUserNotificationSettings *mySettings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:mySettings];
        
    }
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    if ( ![userDefaults valueForKey:@"REMINDER_DATE"] )
    {
        
        
        NSCalendar *calendar = [NSCalendar currentCalendar];
        
        NSDateComponents *components = [[NSDateComponents alloc] init];
        [components setMonth:6];
        
        
        NSDate *reminder_date=[calendar
                               dateByAddingComponents:components toDate:[NSDate date] options:0];
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"dd/MM/yyyy";
        NSString *rem_date_string = [formatter stringFromDate:reminder_date];
        // Adding version number to NSUserDefaults for first version:
        [userDefaults setValue:rem_date_string forKey:@"REMINDER_DATE"];
        
        
        
        
    }
    
    if([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
        
    {
        [application registerForRemoteNotifications];}
    else{
        [application registerForRemoteNotificationTypes:(UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound)];
    }
    

    [[UIApplication sharedApplication]
     setMinimumBackgroundFetchInterval:
     UIApplicationBackgroundFetchIntervalMinimum];
    
        // Override point for customization after application launch.
    return YES;
}


- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    NSLog(@"Did Register for Remote Notifications with Device Token (%@)", deviceToken);
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString * deviceTokenString = [[[[deviceToken description]
                                      stringByReplacingOccurrencesOfString: @"<" withString: @""]
                                     stringByReplacingOccurrencesOfString: @">" withString: @""]
                                    stringByReplacingOccurrencesOfString: @" " withString: @""];
    
    [userDefaults setValue:deviceTokenString forKey:@"DEVICE_TOKEN"];
    
    
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    NSLog(@"Did Fail to Register for Remote Notifications");
    NSLog(@"%@, %@", error, error.localizedDescription);
    
}
-(void)application:(UIApplication *)application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if ( ![userDefaults valueForKey:@"DEVICE_TOKEN"] )
    {
        if([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
            
        {
            [application registerForRemoteNotifications];}
        else{
            [application registerForRemoteNotificationTypes:(UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound)];
        }
        return;
    }
    [self sendNotification];
    completionHandler(UIBackgroundFetchResultNewData);
    
}


- (void)sendNotification{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSString *rem_date_string=[userDefaults valueForKey:@"REMINDER_DATE"];
    
    
    
    NSString *dev_token_string=[userDefaults valueForKey:@"DEVICE_TOKEN"];
    NSDate *today_date=[NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"dd/MM/yyyy";
    NSString *today_date_string = [formatter stringFromDate:today_date];
    
  if ([rem_date_string isEqualToString:today_date_string]) {
    
        
        NSCalendar *calendar = [NSCalendar currentCalendar];
        
        NSDateComponents *components = [[NSDateComponents alloc] init];
        [components setMonth:6];
        
        
        NSDate *reminder_date=[calendar
                               dateByAddingComponents:components toDate:[NSDate date] options:0];
        
        
        formatter.dateFormat = @"dd/MM/yyyy";
        rem_date_string = [formatter stringFromDate:reminder_date];
        
        [userDefaults setValue:rem_date_string forKey:@"REMINDER_DATE"];
        
        
        NSString *url_string=@"http://ds8243.dedicated.webfusion.co.uk/ReferralTracking/api/windsor_appointment_reminder/";
    
    
        url_string=[url_string stringByAppendingString:dev_token_string];
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init]; [request setURL:[NSURL URLWithString:url_string]];
        [request setHTTPMethod:@"GET"];
        
        NSURLResponse *requestResponse;
        NSData *requestHandler = [NSURLConnection sendSynchronousRequest:request returningResponse:&requestResponse error:nil];
    NSString *requestReply = [[NSString alloc] initWithBytes:[requestHandler bytes] length:[requestHandler length] encoding:NSASCIIStringEncoding]; NSLog(@"requestReply: %@", requestReply);
        
   }
    
    
    
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
