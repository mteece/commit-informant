//
//  CIHomeViewController.h
//  CommitInformant
//
//  Created by Matthew Teece on 12/12/12.
//  Copyright (c) 2012 Matthew Teece. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CIHomeViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *userNameTextFieldOutlet;
@property (nonatomic, retain) IBOutlet UILabel *label;

-(void) routeEventList:(NSString *)userName;
@end