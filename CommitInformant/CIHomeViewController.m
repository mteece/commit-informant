//
//  CIHomeViewController.m
//  CommitInformant
//
//  Created by Matthew Teece on 12/12/12.
//  Copyright (c) 2012 Matthew Teece. All rights reserved.
//

#import "CIHomeViewController.h"
#import "CIUserEventListViewController.h"

@interface CIHomeViewController ()

@end

@implementation CIHomeViewController

@synthesize userNameTextFieldOutlet, label;

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    userNameTextFieldOutlet.delegate = self;
    [label setText:@"The Label"];

}

- (void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) routeEventList:(NSString *)userName;
{
    CIUserEventListViewController *nextViewController = [[CIUserEventListViewController alloc] initWithNibNameAndGitHubUserName:@"CIUserEventListViewController" bundle:nil gitHubUserName:userName];
    [self.navigationController pushViewController:nextViewController animated:YES];
}

//Create delegate method of textField
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    NSLog(@"%@", [textField text]);
    if ([textField hasText]) {
        [self routeEventList:[textField text]];
    }
    
    [textField resignFirstResponder]; //to hide keyboard
    return NO;
}

@end
