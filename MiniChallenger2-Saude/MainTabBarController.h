//
//  MainTabBarController.h
//  MiniChallenger2-Saude
//
//  Created by Evandro Remon Pulz Viva on 28/03/15.
//  Copyright (c) 2015 Evandro Remon Pulz Viva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NotificationNavigationController.h"
#import "MoreNavigationController.h"
#import "MedicoDAO.h"
#import "CompleteRegisterViewController.h"
#import "CalendarNavigationViewController.h"
#import "ScheduleNavigationController.h"
#import "SpecialtyNavigationViewController.h"

@interface MainTabBarController : UITabBarController

+(instancetype) sharedInstance;
+(void) resetSharedInstance;

@end
