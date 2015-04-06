//
//  CompleteRegisterViewController.h
//  MiniChallenger2-Saude
//
//  Created by Evandro Remon Pulz Viva on 29/03/15.
//  Copyright (c) 2015 Evandro Remon Pulz Viva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Medico.h"
#import "SpecialtyTableViewController.h"
#import "SpecialtyTableViewCell.h"
#import "ScheduleTableViewController.h"


@interface CompleteRegisterViewController : UIViewController <UIPopoverPresentationControllerDelegate, DismissPopoverDelegate>

- (IBAction)FinishRegisterButton:(UIButton *)sender;
- (IBAction)RememberLaterClick:(UIButton *)sender;
//- (IBAction)InsertSpecialtyClick:(UIButton *)sender;
//- (IBAction)InsertAddressClick:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UITextField *NameTextFiled;
@property (weak, nonatomic) IBOutlet UITextField *docTextFiled;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *ActivityIndicator;
@property (weak, nonatomic) IBOutlet UIButton *SpecialtyButton;
@property (weak, nonatomic) IBOutlet UIButton *AddressButton;
@property (weak, nonatomic) IBOutlet UIButton *RememberLaterButton;
@property (weak, nonatomic) IBOutlet UIButton *FinishRegisterButton;

- (IBAction)NameDidEnd:(UITextField *)sender;
- (IBAction)DocDidEnd:(UITextField *)sender;

- (IBAction)NameEditingDidEnd:(UITextField *)sender;
- (IBAction)DocEditingDidEnd:(UITextField *)sender;



@end
