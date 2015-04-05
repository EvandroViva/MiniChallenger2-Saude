//
//  AddScheduleTableViewController.h
//  MiniChallenger2-Saude
//
//  Created by Evandro Remon Pulz Viva on 02/04/15.
//  Copyright (c) 2015 Evandro Remon Pulz Viva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpecialtyTableViewCell.h"
#import "Schedule.h"
#import "WeeklyTableViewController.h"
#import "DateTimeViewController.h"
#import "DateViewController.h"
#import "TimeViewController.h"
#import <Parse/Parse.h>
#import "Medico.h"

@interface AddScheduleTableViewController : UITableViewController<UIPopoverPresentationControllerDelegate>

@property Schedule* schedule;
@property NSMutableArray* consultations;

@property (weak, nonatomic) IBOutlet UILabel *startsLabel;
@property (weak, nonatomic) IBOutlet UILabel *endsLabel;
@property (weak, nonatomic) IBOutlet UILabel *repeatLabel;
@property (weak, nonatomic) IBOutlet UILabel *endsRepeatLabel;


-(IBAction)DoneClick:(id)sender;


@end
