//
//  AddressViewController.m
//  MiniChallenger2-Saude
//
//  Created by Evandro Remon Pulz Viva on 04/04/15.
//  Copyright (c) 2015 Evandro Remon Pulz Viva. All rights reserved.
//

#import "AddressViewController.h"

@interface AddressViewController ()

@end

@implementation AddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    _street.text=[[Medico sharedDoctor] street];
    _number.text=[[Medico sharedDoctor] number];
    _burgh.text=[[Medico sharedDoctor] burgh];
    _zipcode.text=[[Medico sharedDoctor] cep];
    _district.text=[[Medico sharedDoctor] district];
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



- (IBAction)StreetDidEnd:(UITextField *)sender {
    [[Medico sharedDoctor] setStreet:sender.text andSave:NO];
    [sender endEditing:true];
}

- (IBAction)NumberDidEnd:(UITextField *)sender {
    [[Medico sharedDoctor] setNumber:sender.text andSave:NO];
    [sender endEditing:true];
}

- (IBAction)BurghDidEnd:(UITextField *)sender {
    [[Medico sharedDoctor] setBurgh:sender.text andSave:NO];
    [sender endEditing:true];
}

- (IBAction)CEPDidEnd:(UITextField *)sender {
    [[Medico sharedDoctor] setCep:sender.text andSave:NO];
    [sender endEditing:true];
}
- (IBAction)DistrictDidEnd:(UITextField *)sender {
    [[Medico sharedDoctor] setDistrict:sender.text andSave:NO];
    [sender endEditing:true];
}
@end
