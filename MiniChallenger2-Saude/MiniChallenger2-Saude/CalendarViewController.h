//
//  CalendarViewController.h
//  MiniChallenger2-Saude
//
//  Created by Liliane Bezerra Lima on 28/03/15.
//  Copyright (c) 2015 Evandro Remon Pulz Viva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JTCalendar.h"

@interface CalendarViewController : UIViewController<JTCalendarDataSource,UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet JTCalendarMenuView *calendarMenuView;
@property (weak, nonatomic) IBOutlet JTCalendarContentView *calendarContentView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *calendarContentViewHeight;

@property (strong, nonatomic) JTCalendar *calendar;


@end
