//
//  MoreNavigationController.m
//  MiniChallenger2-Saude
//
//  Created by Evandro Remon Pulz Viva on 28/03/15.
//  Copyright (c) 2015 Evandro Remon Pulz Viva. All rights reserved.
//

#import "MoreNavigationController.h"

@interface MoreNavigationController ()

@end

@implementation MoreNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UITabBarItem *tBItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMore tag:0];
    self.tabBarItem = tBItem;
    
    MoreTableViewController *tableVC = [[MoreTableViewController alloc] initWithNibName:@"MoreTableViewController" bundle:nil];
    [self setViewControllers:@[tableVC]];
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
