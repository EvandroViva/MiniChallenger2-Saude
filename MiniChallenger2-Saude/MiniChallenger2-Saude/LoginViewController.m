//
//  LoginViewController.m
//  MiniChallenger2-Saude
//
//  Created by Evandro Remon Pulz Viva on 3/24/15.
//  Copyright (c) 2015 Evandro Remon Pulz Viva. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()


@end



@implementation LoginViewController

@synthesize ButtonLogin, ButtonSignIn, TextFieldEmail, TextFieldPassword;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [ButtonLogin.layer setCornerRadius:5];
    [ButtonLogin.layer setBorderWidth:1];
    [ButtonLogin.layer setBorderColor:[UIColor blackColor].CGColor];
    
    [ButtonLogin setTintColor: self.view.backgroundColor];
    [ButtonLogin setBackgroundColor:[UIColor whiteColor]];
    

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
