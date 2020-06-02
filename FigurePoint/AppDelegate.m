//
//  AppDelegate.m
//  FigurePoint
//
//  Created by rjb on 2020/6/2.
//  Copyright © 2020 rjb. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"
#import "FigurePoint2ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[FigurePoint2ViewController alloc]init];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
