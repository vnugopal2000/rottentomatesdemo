//
//  MoviesViewController.m
//  RottenTomatoesDemo
//
//  Created by Venu Narayanabhatla on 6/7/14.
//  Copyright (c) 2014 Venu Narayanabhatla. All rights reserved.
//

#import "MoviesViewController.h"
#import "MovieCell.h"
#import "UIImageView+AFNetworking.h"
#import "MBProgressHUD.h"
#import "MDetailViewController.h"
#import "iToast.h"



@interface MoviesViewController ()
@property (weak, nonatomic) IBOutlet UITableView *movieTableView;
@property (nonatomic, strong) NSArray *movies;
@property (nonatomic, strong)NSDictionary *movie;
@property (weak, nonatomic) IBOutlet UISegmentedControl *movieSegmentContrl;
@property (nonatomic, retain) MBProgressHUD *hud;


@end

@implementation MoviesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _hud = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:_hud];
    [_hud show:YES];
    
    self.title = @"MyRottenMovies";

    self.movieTableView.delegate = self;
    self.movieTableView.dataSource = self;
    
    NSString *url = @"http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=tgpaezu83rd2kxqqa53ymn3r";
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        if ( connectionError ) {
            // Here you can inspect the error and act accordingly
           [[iToast makeText:NSLocalizedString(@"Network Connection Error.", @"")] show];
        }
       if ( data == nil) {
            // Here you can inspect the error and act accordingly
            [[iToast makeText:NSLocalizedString(@"Network Connection Error.", @"")] show];
        }
        
        
        NSLog(@"%@", object);
        self.movies = object[@"movies"];
        
        [self.movieTableView reloadData];
         [_hud removeFromSuperview];
        
    }];;
    
    [self.movieTableView registerNib:[UINib nibWithNibName:@"MovieCell" bundle:nil]
              forCellReuseIdentifier:@"MovieCell"];
    self.movieTableView.rowHeight=120;
}

-(void)refreshView:(UIRefreshControl *)refresh {
    refresh.attributedTitle = [[NSAttributedString alloc] initWithString:@"Refreshing data..."];
    
    // custom refresh logic would be placed here...
    
    
    [self.movieTableView registerNib:[UINib nibWithNibName:@"MovieCell" bundle:nil]
              forCellReuseIdentifier:@"MovieCell"];
    self.movieTableView.rowHeight=120;
    
    [refresh endRefreshing];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -Movie Table  View Methods

-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.movies.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MovieCell"];
   
     _movie = self.movies[indexPath.row];
     cell.titleLabel.text = _movie[@"title"];
     cell.synposisLabel.text = _movie[@"synopsis"];
    cell.synposisLabel.numberOfLines = 0;
    cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;
    [cell.synposisLabel sizeToFit];
    
    NSString *imageUrl = _movie[@"posters"][@"thumbnail"];
    NSURL *url = [NSURL URLWithString:imageUrl];
    [cell.thumbnailView setImageWithURL:url];
      return cell;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.row;
    _movie = self.movies[indexPath.row];
    
    NSString *imageUrl = _movie[@"posters"][@"original"];
    NSURL *url = [NSURL URLWithString:imageUrl];
    NSData *imageData = [NSData dataWithContentsOfURL:url];
    
    MDetailViewController *myViewController = [[MDetailViewController alloc] init];
    myViewController.movieDetail = _movie;
     [self.navigationController pushViewController:myViewController animated:YES];

  /* UIViewController *myViewController = [[UIViewController alloc] init];
    
  
    
    myViewController.title = _movie[@"title"];
    myViewController.view.frame = CGRectInset(self.view.bounds, 0, 50);
    
    UIImage *background = [UIImage imageWithData:imageData];
    UIImageView *backgroundView = [[UIImageView alloc] initWithImage: background];
    
    [self.view addSubview: backgroundView];
    [self.view sendSubviewToBack:backgroundView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:myViewController.view.bounds];
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
     label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldSystemFontOfSize:16.0f];
    label.textColor = [UIColor blackColor];
   
  // label.backgroundColor =  [UIColor colorWithPatternImage:[UIImage imageWithData:imageData]];
    label.textAlignment = NSTextAlignmentCenter;
    label.numberOfLines = 0;
    label.text = _movie[@"synopsis"];
    [myViewController.view addSubview:label];

    label.reloadInputViews;
    label.text = _movie[@"synopsis"];
    //to push the UIView.  
   */
    
 


    


}



@end
