//
//  LoginViewController.h
//  SIMPLECO
//
//  Created by Liliane Bezerra Lima on 26/03/15.
//  Copyright (c) 2015 Liliane Bezerra Lima. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "ConsultaViewController.h"
#import "UsuarioDAO.h"
#import "TabBarController.h"

@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *login;
@property (weak, nonatomic) IBOutlet UITextField *TFLogin;
@property (weak, nonatomic) IBOutlet UITextField *TFSenha;
@property NSString *UltimoCadastro;
@property NSString *UltimaSenha;

- (IBAction)BConfirma:(id)sender;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *Carregando;

+ (NSMutableArray*)sharedEventos;
+ (LoginViewController*)sharedInstance;

@end
