//
//  AppDelegate.m
//  JWBestPracticeApps
//
//  Created by Karim Mourra on 3/15/16.
//  Copyright © 2016 Karim Mourra. All rights reserved.
//

#import "AppDelegate.h"
#import <JWPlayer_iOS_SDK/JWPlayerController.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.    
    [JWPlayerController setPlayerKey:@"ADD-SDK-KEY-HERE"];
    return YES;
}

@end
