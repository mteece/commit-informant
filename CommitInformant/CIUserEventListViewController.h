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
    NSMutableArray *_events;
}

@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) UIActivityIndicatorView *activityIndicatorView;
@property (nonatomic, retain) NSMutableArray *events;

@end
