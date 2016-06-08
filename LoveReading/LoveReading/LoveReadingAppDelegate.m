//
//  LoveReadingAppDelegate.m
//  LoveReading
//
//  Created by BJ13041603-002 on 16/6/6.
//  Copyright © 2016年 刘建立. All rights reserved.
//

#import "LoveReadingAppDelegate.h"
#import "LRTxtReaderController.h"

@implementation LoveReadingAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    LRTxtReaderController *lrBase = [[LRTxtReaderController alloc]init];
    self.window.rootViewController = lrBase;
    
    return YES;
}

- (void)moveToLoginViewController{
    UINavigationController *userLoginViewNavVC = (UINavigationController *)[ToolUtil loadViewControllerWithStoryboardId:@"LRUserLogin/LRUserLoginNavVC"];
    if(userLoginViewNavVC) {
        [defaults setObject:@"" forKey:UDKEY_USER_ID];
        [defaults setObject:@"" forKey:UDKEY_USER_NAME];
        [defaults setObject:@"" forKey:UDKEY_TOKEN];
        [defaults synchronize];
        self.window.rootViewController = userLoginViewNavVC;
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

@end
