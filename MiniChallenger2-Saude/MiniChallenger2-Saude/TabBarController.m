//
//  TabBarController.m
//  MiniChallenger2-Saude
//
//  Created by Evandro Remon Pulz Viva on 26/03/15.
//  Copyright (c) 2015 Evandro Remon Pulz Viva. All rights reserved.
//

#import "TabBarController.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

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

-(void)viewDidAppear:(BOOL)animated
{
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
