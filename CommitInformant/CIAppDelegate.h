//
//  CIAppDelegate.h
//  CommitInformant
//
//  Created by Matthew Teece on 11/14/12.
//  Copyright (c) 2012 Matthew Teece. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CIHomeViewController;

@interface CIAppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) CIHomeViewController *viewController;

- (void) customizeAppearance;

@end
