//
//  movieTableCell.h
//  RottenTomatoesDemo
//
//  Created by Venu Narayanabhatla on 6/8/14.
//  Copyright (c) 2014 Venu Narayanabhatla. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *synposisLabel;
@property (nonatomic, weak) IBOutlet UIImageView *thumbnailView;



@end
