//
//  MainTabBarController.m
//  MiniChallenger2-Saude
//
//  Created by Evandro Remon Pulz Viva on 28/03/15.
//  Copyright (c) 2015 Evandro Remon Pulz Viva. All rights reserved.
//

#import "MainTabBarController.h"

@interface MainTabBarController ()

@end

static MainTabBarController *sharedMainTabBarController = nil;

@implementation MainTabBarController

+(instancetype) sharedInstance
{
    if (sharedMainTabBarController == nil) {
        sharedMainTabBarController = [[MainTabBarController alloc] initWithNibName:@"MainTabBarController" bundle:nil];
    }
    return sharedMainTabBarController;
}

+(void) resetSharedInstance
{
    sharedMainTabBarController = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NotificationNavigationController *navNotif = [[NotificationNavigationController alloc] init];
    MoreNavigationController *navMore = [[MoreNavigationController alloc] init];
    ScheduleNavigationController *navSchedule = [[ScheduleNavigationController alloc] init];
    
    CalendarNavigationViewController *navCalendar = [[CalendarNavigationViewController alloc] init];
    
    [self setViewControllers:@[navCalendar, navSchedule,navNotif,navMore]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated
{
    
    [MedicoDAO getMedicoByPFUser:[PFUser currentUser] AndComplete:^(NSError *error){
        Medico *m = [Medico sharedDoctor];
        if ([[m name] isEqualToString:@""] || [m name] == nil || [[m cod] isEqualToString:@""] || [m cod] == nil) {
        
                CompleteRegisterViewController *completeregister = [[CompleteRegisterViewController alloc] initWithNibName:@"CompleteRegisterViewController" bundle:nil];
//                completeregister set
                [self presentViewController:completeregister animated:true completion:nil];
        }
    }];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
