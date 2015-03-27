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
//    UITabBarItem *item = [[UITabBarItem alloc] init];
//    [item setImage:[UIImage imageNamed:@"Image"]];
    
    UITabBarItem* doctorItem = [self.tabBar.items objectAtIndex:0];
    
    [doctorItem setSelectedImage:[UIImage imageNamed:@"calendar"]];
    [doctorItem setImage:[UIImage imageNamed:@"calendar"]];
    [doctorItem setTitle:@"Calendário"];
    
    UITabBarItem* patientItem = [self.tabBar.items objectAtIndex:1];
    
    [patientItem setSelectedImage:[UIImage imageNamed:@"notification"]];
    [patientItem setImage:[UIImage imageNamed:@"notification"]];
    [patientItem setTitle:@"Notificações"];
    
    
    
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
