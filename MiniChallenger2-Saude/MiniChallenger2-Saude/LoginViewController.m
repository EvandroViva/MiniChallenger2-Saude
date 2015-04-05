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
    [self.loginActivityIndicator setHidden:YES];
    
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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


- (IBAction)ButtonLoginClick:(UIButton *)sender {
   [self.loginActivityIndicator setHidden:NO];

//    MainTabBarController *main = [MainTabBarController sharedInstance];
    
    [UserDAO loginWithUsername:[self.TextFieldEmail text] AndPassword:[self.TextFieldPassword text] AndComplete:^(PFUser *pfuser, NSError *error){
        if (!error) {
            [self.loginActivityIndicator setHidden:YES];
            
            if (![[pfuser objectForKey:@"emailVerified"] boolValue]) {
            
                [[Medico sharedDoctor] setParseUser:pfuser];
                
                
                PFRelation *relation = [pfuser relationForKey:@"doctor"];
                [[relation query] findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
                    
                    Medico *m = [Medico sharedDoctor];
                    if ([objects count] > 0) {
                        [m setWithPFObject:objects[0]];
                        [self performSegueWithIdentifier:@"login" sender:self] ;
                    } else {
                        PFObject *doctor = [[PFObject alloc] initWithClassName:@"Medico"];
                        
                        [relation addObject:doctor];
                        [m setParseObject:doctor];
                        
;
                        [doctor saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                            [pfuser saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                                [self performSegueWithIdentifier:@"login" sender:self];
                            }];
                            
                        }];
                    }

                    
                }];
            
            }else{
                [[[UIAlertView alloc] initWithTitle:@"Email Não Verificado" message:@"Por favor, verifique seu email." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil] show];
            }
        } else {
            [self.loginActivityIndicator setHidden:YES];
            [[[UIAlertView alloc] initWithTitle:@"Usuário Inválido" message:@"E-mail e/ou senha estão inválidos." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil] show];
        }
            
    }];
}


@end
