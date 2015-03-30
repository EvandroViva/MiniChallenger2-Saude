//
//  SignInViewController.m
//  MiniChallenger2-Saude
//
//  Created by Evandro Remon Pulz Viva on 29/03/15.
//  Copyright (c) 2015 Evandro Remon Pulz Viva. All rights reserved.
//

#import "SignInViewController.h"

@interface SignInViewController ()

@end

@implementation SignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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

- (IBAction)SignInButtonClick:(UIButton *)sender {
    
    User *user = [[User alloc] init];
    [user setUsername: [self.UserNameTextField text]];
    [user setPassword: [self.PasswordTextField text]];
    [user setEmail: [self.EmailTextField text]];
    
    [UserDAO signinWithUser:user AndComplete: ^(bool succeeded, NSError* error){
    
        if (succeeded) {
            [self dismissViewControllerAnimated:YES completion:nil];
        } else {
            NSString *errorString = [error userInfo][@"error"];
            [[[UIAlertView alloc] initWithTitle:@"Erro" message: errorString delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil] show];
        }
    
    }];
    
    
}


- (IBAction)CancelButtonClick:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
