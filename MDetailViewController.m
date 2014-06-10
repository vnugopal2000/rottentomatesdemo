//
//  MDetailViewController.m
//  RottenTomatoesDemo
//
//  Created by Venu Narayanabhatla on 6/9/14.
//  Copyright (c) 2014 Venu Narayanabhatla. All rights reserved.
//

#import "MDetailViewController.h"

@interface MDetailViewController ()

@end

@implementation MDetailViewController

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
    // Do any additional setup after loading the view from its nib.
    NSString *imageUrl = _movieDetail[@"posters"][@"original"];
    NSURL *url = [NSURL URLWithString:imageUrl];
    NSData *imageData = [NSData dataWithContentsOfURL:url];
    UIImage *background = [UIImage imageWithData:imageData];
    self.MDetailImage.image = [UIImage imageWithData:imageData]; 
    self.title = _movieDetail[@"title"];
    self.MDetailLabel.text = _movieDetail[@"synopsis"];
    self.MDetailLabel.numberOfLines = 0;
    [ self.MDetailLabel sizeToFit];
    
   

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
