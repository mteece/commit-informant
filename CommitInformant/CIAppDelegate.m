//
//  CIAppDelegate.m
//  CommitInformant
//
//  Created by Matthew Teece on 11/14/12.
//  Copyright (c) 2012 Matthew Teece. All rights reserved.
//

#import "CIAppDelegate.h"
#import "CIHomeViewController.h"

@implementation CIAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self customizeAppearance];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    CIHomeViewController *myViewController = [[CIHomeViewController alloc] init];
    [myViewController setTitle:@"My Title"];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:myViewController];
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void) customizeAppearance
{
    /*UIColor *c = [[UIColor alloc] initWithCIColor:[UIColor colorWithRed:0.157 green:0.169 blue:0.235 alpha:1.0]];*/
#warning Use the code below to set the global background color in IOS5+
    //[[UIViewCView appearance] setBackgroundColor:[UIColor grayColor]];
    
    UIImage *tileImage = [UIImage imageNamed:@"header"];
    
    
    //[[UINavigationBar appearance] setBackgroundImage:tileImage forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setTintColor:[UIColor colorWithRed:0.157 green:0.169 blue:0.235 alpha:1.0]];
    // Customize the title text for *all* UINavigationBars
    [[UINavigationBar appearance] setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0],
      UITextAttributeTextColor,
      [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8],
      UITextAttributeTextShadowColor,
      [NSValue valueWithUIOffset:UIOffsetMake(1, 1)],
      UITextAttributeTextShadowOffset,
      [UIFont fontWithName:@"Cantarell-Regular" size:18.0],
      UITextAttributeFont,
      nil]];
    
    [[UILabel appearance] setFont:[UIFont fontWithName:@"Cantarell-Regular" size:12.0]];
    NSLog(@" %@", [UIFont fontNamesForFamilyName:@"Cantarell"]);
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
