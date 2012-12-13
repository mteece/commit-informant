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

    [_label setText:@"The Label"];

}

- (void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction) routeEventList:(id)sender
{
    CIUserEventListViewController *nextViewController = [[CIUserEventListViewController alloc] initWithNibName:@"CIUserEventListViewController" bundle:nil];
    //[nextViewController setRequestId:identity];
    [self.navigationController pushViewController:nextViewController animated:YES];
}
@end
