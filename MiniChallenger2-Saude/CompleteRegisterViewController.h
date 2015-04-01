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

@interface CompleteRegisterViewController : UIViewController

- (IBAction)FinishRegisterButton:(UIButton *)sender;
- (IBAction)RememberLaterClick:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UITextField *NameTextFiled;
@property (weak, nonatomic) IBOutlet UITextField *docTextFiled;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *ActivityIndicator;


@end
