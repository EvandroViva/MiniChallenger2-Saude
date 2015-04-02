//
//  SpecialtyNavigationViewController.m
//  MiniChallenger2-Saude
//
//  Created by Cauê Silva on 02/04/15.
//  Copyright (c) 2015 Evandro Remon Pulz Viva. All rights reserved.
//

#import "SpecialtyNavigationViewController.h"

@interface SpecialtyNavigationViewController ()

@end

@implementation SpecialtyNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SpecialtyTableViewController *specialtyVC = [[SpecialtyTableViewController alloc]initWithNibName:@"SpecialtyTableViewController" bundle:nil];
    [self setViewControllers:@[specialtyVC]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
