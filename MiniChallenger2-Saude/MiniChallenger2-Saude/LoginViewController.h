//
//  LoginViewController.h
//  MiniChallenger2-Saude
//
//  Created by Evandro Remon Pulz Viva on 3/24/15.
//  Copyright (c) 2015 Evandro Remon Pulz Viva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DAO/MedicoDAO.h"
#import "MainTabBarController.h"

@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *ButtonLogin;
@property (weak, nonatomic) IBOutlet UIButton *ButtonSignIn;
@property (weak, nonatomic) IBOutlet UITextField *TextFieldEmail;
@property (weak, nonatomic) IBOutlet UITextField *TextFieldPassword;
- (IBAction)ButtonLoginClick:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loginActivityIndicator;


@end
