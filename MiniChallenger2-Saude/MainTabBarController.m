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

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    NotificationNavigationController *navNotif = [[NotificationNavigationController alloc] init];
    MoreNavigationController *navMore = [[MoreNavigationController alloc] init];
    [self setViewControllers:@[navNotif,navMore]];
    
    
//    UITabBarItem* patientItem = [self.tabBar.items objectAtIndex:1];
//    
//    [patientItem setSelectedImage:[UIImage imageNamed:@"notification"]];
//    [patientItem setImage:[UIImage imageNamed:@"notification"]];
//    [patientItem setTitle:@"Notificações"];
//    
//    UITabBarItem* HorariotItem = [self.tabBar.items objectAtIndex:2];
//    
//    [HorariotItem setSelectedImage:[UIImage imageNamed:@"doctor"]];
//    [HorariotItem setImage:[UIImage imageNamed:@"doctor"]];
//    [HorariotItem setTitle:@"Horarios"];
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
