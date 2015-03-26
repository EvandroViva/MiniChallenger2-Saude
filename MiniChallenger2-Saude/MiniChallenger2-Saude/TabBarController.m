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
    
    UITabBarItem* doctorItem = [self.tabBar.items objectAtIndex:1];
    
    [doctorItem setSelectedImage:[UIImage imageNamed:@"Doctor"]];
    [doctorItem setImage:[UIImage imageNamed:@"Doctor"]];
    [doctorItem setTitle:@"Médico"];
    
    UITabBarItem* patientItem = [self.tabBar.items objectAtIndex:0];
    
    [patientItem setSelectedImage:[UIImage imageNamed:@"Patient"]];
    [patientItem setImage:[UIImage imageNamed:@"Patient"]];
    [patientItem setTitle:@"Paciente"];
    
    
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
