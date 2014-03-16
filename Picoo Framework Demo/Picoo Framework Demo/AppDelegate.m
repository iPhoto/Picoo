//
//  AppDelegate.m
//  Picoo Framework Demo
//
//  Created by Mohd Iftekhar Qurashi on 16/04/2014.
//  Copyright (c) 2014 Iftekhar. All rights reserved.

#import "AppDelegate.h"
#import <Picoo/IQPhotoEditorManager.h>


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    return YES;
}

-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    [[IQPhotoEditorManager sharedManager] handleOpenURL:url];

    return YES;
}

@end
