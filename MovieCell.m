//
//  movieTableCell.m
//  RottenTomatoesDemo
//
//  Created by Venu Narayanabhatla on 6/8/14.
//  Copyright (c) 2014 Venu Narayanabhatla. All rights reserved.
//

#import "MovieCell.h"

@implementation MovieCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
 /*   if (selected) {
        self.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    } else {
        self.accessoryType = UITableViewCellAccessoryNone;
    }*/
    
    
    
}

@end
