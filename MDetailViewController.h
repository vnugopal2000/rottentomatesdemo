//
//  MDetailViewController.h
//  RottenTomatoesDemo
//
//  Created by Venu Narayanabhatla on 6/9/14.
//  Copyright (c) 2014 Venu Narayanabhatla. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *MDetailLabel;
@property (weak, nonatomic) IBOutlet UIImageView *MDetailImage;

@property (nonatomic, strong)NSDictionary *movieDetail;
@end
