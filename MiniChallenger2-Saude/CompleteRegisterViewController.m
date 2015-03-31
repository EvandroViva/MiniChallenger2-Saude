//
//  CompleteRegisterViewController.m
//  MiniChallenger2-Saude
//
//  Created by Evandro Remon Pulz Viva on 29/03/15.
//  Copyright (c) 2015 Evandro Remon Pulz Viva. All rights reserved.
//

#import "CompleteRegisterViewController.h"

@interface CompleteRegisterViewController ()

@end

@implementation CompleteRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    Medico *m1 = [Medico sharedDoctor];
    [self.NameTextFiled setText:[m1 nome]];
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

- (IBAction)FinishRegisterButton:(UIButton *)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

- (IBAction)RememberLaterClick:(UIButton *)sender {
    Medico *m1 = [Medico sharedDoctor];
    [m1 setRemember_later:true];
    [self dismissViewControllerAnimated:true completion:nil];
}
- (IBAction)InsertSpecialtyClick:(UIButton *)sender {
    SpecialtyTableViewController *stvc = [[SpecialtyTableViewController alloc] initWithNibName:@"SpecialtyTableViewController" bundle:nil];
    [self presentViewController: stvc animated:TRUE completion:nil];
}
- (IBAction)InsertAddressClick:(UIButton *)sender {
}
@end
