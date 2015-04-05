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

    }
    return sharedMainTabBarController;
}

+(void) resetSharedInstance
{
    sharedMainTabBarController = nil;
}

- (void)viewDidLoad {
    
    UITabBarItem* horarioItem = [self.tabBar.items objectAtIndex:0];
    
    [horarioItem setSelectedImage:[UIImage imageNamed:@"schedule"]];
    [horarioItem setImage:[UIImage imageNamed:@"schedule"]];
    [horarioItem setTitle:@"Horários"];
    
    UITabBarItem* calendarItem = [self.tabBar.items objectAtIndex:1];
    
    [calendarItem setSelectedImage:[UIImage imageNamed:@"calendar"]];
    [calendarItem setImage:[UIImage imageNamed:@"calendar"]];
    [calendarItem setTitle:@"Calendário"];
    
    UITabBarItem* notificaooesItem = [self.tabBar.items objectAtIndex:2];
    
    [notificaooesItem setSelectedImage:[UIImage imageNamed:@"notifications"]];
    [notificaooesItem setImage:[UIImage imageNamed:@"notifications"]];
    [notificaooesItem setTitle:@"Notificações"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated
{

       Medico *m = [Medico sharedDoctor];
    if (![m remember_later])
    if ([[m name] isEqualToString:@""] || [m name] == nil || [[m cod] isEqualToString:@""] || [m cod] == nil) {
        
        [self performSegueWithIdentifier:@"CompleteRegister" sender:self];
    }
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
