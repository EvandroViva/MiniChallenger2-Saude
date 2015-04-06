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
    
    
    [self.SpecialtyButton.layer setCornerRadius:5];
    [self.SpecialtyButton.layer setBorderWidth:1];
    [self.SpecialtyButton.layer setBorderColor:[UIColor blackColor].CGColor];
    

    [self.SpecialtyButton setBackgroundColor:[UIColor whiteColor]];
    
    [self.AddressButton.layer setCornerRadius:5];
    [self.AddressButton.layer setBorderWidth:1];
    [self.AddressButton.layer setBorderColor:[UIColor blackColor].CGColor];

    [self.AddressButton setBackgroundColor:[UIColor whiteColor]];
    
    [self.RememberLaterButton.layer setCornerRadius:5];
    [self.RememberLaterButton.layer setBorderWidth:1];
    [self.RememberLaterButton.layer setBorderColor:[UIColor blackColor].CGColor];
    
    [self.RememberLaterButton setBackgroundColor:[UIColor whiteColor]];
    
    [self.FinishRegisterButton.layer setCornerRadius:5];
    [self.FinishRegisterButton.layer setBorderWidth:1];
    [self.FinishRegisterButton.layer setBorderColor:[UIColor blackColor].CGColor];
    
    [self.FinishRegisterButton setBackgroundColor:[UIColor whiteColor]];

    CAGradientLayer *background = [CAGradientLayer layer];
    background.colors = @[(id)[UIColor colorWithRed:0 green:201/255.0 blue:255/255.0 alpha:1.0].CGColor, (id)[UIColor colorWithRed:0/255.0 green:70/255.0 blue:163/255.0 alpha:1.0].CGColor];
    background.locations = @[@0.2,@1.0];
    background.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    [self.view.layer insertSublayer:background atIndex:0];
    
    [self.NameTextFiled endEditing:true];
    [self.docTextFiled endEditing:true];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    Medico *m1 = [Medico sharedDoctor];
    [self.NameTextFiled setText:[m1 name]];
    [self.docTextFiled setText:[m1 cod]];
    if (![[m1 specialty] isEqualToString:@""] && [m1 specialty] != nil)
        [self.SpecialtyButton setTitle:[m1 specialty] forState:UIControlStateNormal];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"showPopover"]) {
        UINavigationController *destNav = segue.destinationViewController;
        UIPopoverPresentationController *popPC = destNav.popoverPresentationController;
        popPC.delegate = self;
        
        
    }
    if ([segue.identifier isEqualToString:@"specialtyShowPopover"]) {
        SpecialtyTableViewController *dest = segue.destinationViewController;
        UIPopoverPresentationController *popPC = dest.popoverPresentationController;
        popPC.delegate = self;
        dest.delegate = self;
        
        
    }
}

- (IBAction)FinishRegisterButton:(UIButton *)sender {
    [self.ActivityIndicator setHidden:false];
    Medico *m = [Medico sharedDoctor];
    [m setName:[self.NameTextFiled text] andSave:false];
    [m setCod:[self.docTextFiled text] andSave:false];
    [[m parseObject] saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error){
        if (succeeded) {
            [self dismissViewControllerAnimated:true completion:nil];
        }
        [self.ActivityIndicator setHidden:true];
    }];
}

- (IBAction)RememberLaterClick:(UIButton *)sender {
    Medico *m1 = [Medico sharedDoctor];
    [m1 setRemember_later:true];
    [self dismissViewControllerAnimated:true completion:nil];
}
//- (IBAction)InsertSpecialtyClick:(UIButton *)sender {
////    SpecialtyTableViewController *stvc = [[SpecialtyTableViewController alloc] initWithNibName:@"SpecialtyTableViewController" bundle:nil];
////    [self.navigationController pushViewController:stvc animated:YES];
//}
//- (IBAction)InsertAddressClick:(UIButton *)sender {
////    ScheduleTableViewController *schTVC = [[ScheduleTableViewController alloc]initWithNibName:@"ScheduleTableViewController" bundle:nil];
////    [self.navigationController pushViewController:schTVC animated:YES];
//}


- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
    return UIModalPresentationNone;
}

-(void)popoverPresentationControllerDidDismissPopover:(UIPopoverPresentationController *)popoverPresentationController
{
    Medico *m1 = [Medico sharedDoctor];
    [self.NameTextFiled setText:[m1 name]];
    [self.docTextFiled setText:[m1 cod]];
    if (![[m1 specialty] isEqualToString:@""] && [m1 specialty] != nil)
        [self.SpecialtyButton setTitle:[m1 specialty] forState:UIControlStateNormal];
}

-(void)dismissPopover
{
    Medico *m1 = [Medico sharedDoctor];
    [self.NameTextFiled setText:[m1 name]];
    [self.docTextFiled setText:[m1 cod]];
    if (![[m1 specialty] isEqualToString:@""] && [m1 specialty] != nil)
        [self.SpecialtyButton setTitle:[m1 specialty] forState:UIControlStateNormal];
    
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:true];
}

- (IBAction)NameDidEnd:(UITextField *)sender
{
    [self.docTextFiled becomeFirstResponder];
}
- (IBAction)DocDidEnd:(UITextField *)sender
{
    [sender resignFirstResponder];
}

- (IBAction)NameEditingDidEnd:(UITextField *)sender {
    [[Medico sharedDoctor] setName:sender.text andSave:NO];
}

- (IBAction)DocEditingDidEnd:(UITextField *)sender {
    [[Medico sharedDoctor] setCod:sender.text andSave:NO];
}



@end
