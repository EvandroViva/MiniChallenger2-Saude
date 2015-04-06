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
    _StreetTextField.text=[[Medico sharedDoctor] street];
    _NumberTextField.text=[[Medico sharedDoctor] number];
    _BurghTextField.text=[[Medico sharedDoctor] burgh];
    _ZipCodeTextField.text=[[Medico sharedDoctor] cep];
    _DistrictTextField.text=[[Medico sharedDoctor] district];
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
    [self.NumberTextField becomeFirstResponder];
}

- (IBAction)NumberDidEnd:(UITextField *)sender {
    [[Medico sharedDoctor] setNumber:sender.text andSave:NO];
    [self.BurghTextField becomeFirstResponder];
}

- (IBAction)BurghDidEnd:(UITextField *)sender {
    [[Medico sharedDoctor] setBurgh:sender.text andSave:NO];
    [self.ZipCodeTextField becomeFirstResponder];
}

- (IBAction)ZipCodeDidEnd:(UITextField *)sender {
    [[Medico sharedDoctor] setCep:sender.text andSave:NO];
    [self.DistrictTextField becomeFirstResponder];
}
- (IBAction)DistrictDidEnd:(UITextField *)sender {
    [[Medico sharedDoctor] setDistrict:sender.text andSave:NO];
    [self.view endEditing:true];
    [self dismissViewControllerAnimated:true completion:nil];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:true];
}
@end
