//
//  CalendarViewController.h
//  MiniChallenger2-Saude
//
//  Created by Evandro Remon Pulz Viva on 31/03/15.
//  Copyright (c) 2015 Evandro Remon Pulz Viva. All rights reserved.
//
#import "JTCalendar.h"
#import <UIKit/UIKit.h>

@interface CalendarViewController : UIViewController<JTCalendarDataSource>

//XIB
//@property (weak, nonatomic) IBOutlet NSLayoutConstraint *calendarContentViewHeight;
//@property (weak, nonatomic) IBOutlet JTCalendarContentView *calendarContentView;
//@property (weak, nonatomic) IBOutlet JTCalendarMenuView *calendarMenuView;
//@property (strong, nonatomic) JTCalendar *calendar;
//- (IBAction)Hoje:(id)sender;
//- (IBAction)Visualizacao:(id)sender;


//STORYBOARD
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *calendarContentViewHeight;
@property (weak, nonatomic) IBOutlet JTCalendarContentView *calendarContentView;
@property (weak, nonatomic) IBOutlet JTCalendarMenuView *calendarMenuView;
@property (strong, nonatomic) JTCalendar *calendar;
//- (IBAction)Hoje:(id)sender;
//- (IBAction)Visualizacao:(id)sender;

@end
