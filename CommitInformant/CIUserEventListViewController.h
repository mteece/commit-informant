//
//  CIViewController.h
//  CommitInformant
//
//  Created by Matthew Teece on 11/14/12.
//  Copyright (c) 2012 Matthew Teece. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CIUserEventListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    UITableView *_tableView;
    UIActivityIndicatorView *_activityIndicatorView;
    
    UISearchDisplayController *searchDisplayController;
    UISearchDisplayController *searchBar;
    NSArray *searchResults;
    
    NSMutableArray *_events;
    
    NSString *gitHubUserName;
}

@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) UIActivityIndicatorView *activityIndicatorView;

@property (retain, nonatomic) IBOutlet UISearchDisplayController *searchBar;
@property (retain, nonatomic) IBOutlet UISearchDisplayController *searchDisplayController;

@property (nonatomic, copy) NSArray *searchResults;
@property (nonatomic, retain) NSMutableArray *events;
@property (nonatomic, retain) NSString *gitHubUserName;

- (id)initWithNibNameAndGitHubUserName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil gitHubUserName:(NSString *)userName;
@end
