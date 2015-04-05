//
//  MoreTableViewController.h
//  MiniChallenger2-Saude
//
//  Created by Evandro Remon Pulz Viva on 28/03/15.
//  Copyright (c) 2015 Evandro Remon Pulz Viva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainTabBarController.h"
#import "MoreTableViewController.h"
#import "MoreTableViewCell.h"
#import <Parse/Parse.h>
#import "Medico.h"

@interface MoreTableViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UILabel *NameLabel;
@property (weak, nonatomic) IBOutlet UILabel *DocLabel;

@end
