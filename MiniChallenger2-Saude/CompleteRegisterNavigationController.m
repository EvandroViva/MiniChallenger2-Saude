//
//  SpecialtyNavigationViewController.m
//  MiniChallenger2-Saude
//
//  Created by Cauê Silva on 02/04/15.
//  Copyright (c) 2015 Evandro Remon Pulz Viva. All rights reserved.
//

#import "CompleteRegisterNavigationController.h"

@interface CompleteRegisterNavigationController ()

@end

@implementation CompleteRegisterNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CompleteRegisterViewController *completeregisterVC = [[CompleteRegisterViewController alloc]initWithNibName:@"CompleteRegisterViewController" bundle:nil];
    [self setViewControllers:@[completeregisterVC]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
