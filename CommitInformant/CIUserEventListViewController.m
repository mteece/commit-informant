//
//  CIViewController.m
//  CommitInformant
//
//  Created by Matthew Teece on 11/14/12.
//  Copyright (c) 2012 Matthew Teece. All rights reserved.
//
#import "CIAppDelegate.h"
#import "CIUserEventListViewController.h"
#import "AFNetworking.h"

@implementation CIUserEventListViewController

@synthesize tableView = _tableView;
@synthesize activityIndicatorView = _activityIndicatorView;
@synthesize events = _events;
@synthesize searchDisplayController;
@synthesize searchBar;
@synthesize searchResults;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
    // In this case we are not going to use the .xib file for IB.
    NSString *baseUrl = [[NSString alloc] initWithFormat:@"https://api.github.com/users/mteece/events"];
    
    // Initialize the tableView through code.
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0, 50.0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.tableView.hidden = YES;
    
    // Add the tableView as a subview.
    [self.view addSubview:self.tableView];
    
    // Initialize the activityIndicatorView.
    self.activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.activityIndicatorView.hidesWhenStopped = YES;
    self.activityIndicatorView.center = self.view.center;
    
    // Add the activityIndicatorView as a subView.
    [self.view addSubview:self.activityIndicatorView];
    [self.activityIndicatorView startAnimating];
    
    // Allocate array.
    self.events = [[NSMutableArray alloc] init];
    
    // AFNetworking fun.
    NSURL *url = [[NSURL alloc] initWithString:baseUrl];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        NSLog(@"Request success JSON received.");
        //self.movies = [JSON objectAtIndex:0];
        for(id entry in JSON) {
            [self.events addObject:entry];
            NSLog(@"entry key: %@", entry);
        }
        
        [self.activityIndicatorView stopAnimating];
        [self.tableView setHidden:NO];
        [self.tableView reloadData];
        
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        NSLog(@"Request failed with error: %@.", error);
    }];
    
    [operation start];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark UITableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger rows = 0;
    
    if ([tableView isEqual:self.searchDisplayController.searchResultsTableView]){
        rows = [self.searchResults count];
    }
    else{
        rows = [self.events count];
    }
    
    return rows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"Cell Id";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if(!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
   
    NSDictionary *eventItem = [[NSDictionary alloc] init];
    /* Configure the cell. */
    if ([tableView isEqual:self.searchDisplayController.searchResultsTableView]) {
        eventItem = [self.searchResults objectAtIndex:indexPath.row];
        cell.textLabel.text = [eventItem objectForKey:@"type"];
        cell.detailTextLabel.text = [eventItem objectForKey:@"created_at"];    }
    else {
        eventItem = [self.events objectAtIndex:indexPath.row];
        cell.textLabel.text = [eventItem objectForKey:@"type"];
        cell.detailTextLabel.text = [eventItem objectForKey:@"created_at"];
    }
        
    //NSURL *url = [[NSURL alloc] initWithString:[movie objectForKey:@"avatar_url"]];
    //NSData *data = [NSData dataWithContentsOfURL:url];
    
    //cell.imageView.image = [[UIImage alloc] initWithData:data];
    
    return cell;
}

#pragma mark -
#pragma mark NSPredicate
- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSPredicate *resultPredicate = [NSPredicate
                                    predicateWithFormat:@"type contains[cd] %@",
                                    searchText];
    
    self.searchResults = [self.events filteredArrayUsingPredicate:resultPredicate];
}

#pragma mark - UISearchDisplayController delegate methods
-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
    
    return YES;
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption
{
    [self filterContentForSearchText:[self.searchDisplayController.searchBar text]
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:searchOption]];
    
    return YES;
}
@end
