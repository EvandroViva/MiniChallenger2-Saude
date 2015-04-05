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
    
    [self.SignInButton.layer setCornerRadius:5];
    [self.SignInButton.layer setBorderWidth:1];
    [self.SignInButton.layer setBorderColor:[UIColor blackColor].CGColor];
    [self.SignInButton setBackgroundColor:[UIColor whiteColor]];
    
    [self.CancelButton.layer setCornerRadius:5];
    [self.CancelButton.layer setBorderWidth:1];
    [self.CancelButton.layer setBorderColor:[UIColor blackColor].CGColor];
    [self.CancelButton setBackgroundColor:[UIColor whiteColor]];
    
    CAGradientLayer *background = [CAGradientLayer layer];
    background.colors = @[(id)[UIColor colorWithRed:0 green:201/255.0 blue:255/255.0 alpha:1.0].CGColor, (id)[UIColor colorWithRed:0/255.0 green:70/255.0 blue:163/255.0 alpha:1.0].CGColor];
    background.locations = @[@0.2,@1.0];
    background.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    [self.view.layer insertSublayer:background atIndex:0];
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
