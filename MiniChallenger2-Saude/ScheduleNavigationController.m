//
//  ScheduleNavigationController.m
//  MiniChallenger2-Saude
//
//  Created by Evandro Remon Pulz Viva on 01/04/15.
//  Copyright (c) 2015 Evandro Remon Pulz Viva. All rights reserved.
//

#import "ScheduleNavigationController.h"

@interface ScheduleNavigationController ()

@end

@implementation ScheduleNavigationController

-(instancetype)init
{
    self = [super init];
    if (self) {
        //Configurações do Botão do tabBar
        NSString *title = @"Horários";
        UITabBarItem* tBItem = [[UITabBarItem alloc] initWithTitle:title image:[UIImage imageNamed:@"schedule"] selectedImage:[UIImage imageNamed:@"schedule"]];
        self.tabBarItem = tBItem;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    ScheduleTableViewController *scheduleVC = [[ScheduleTableViewController alloc] initWithNibName:@"ScheduleTableViewController" bundle:nil];
    [self setViewControllers:@[scheduleVC]];
    
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
