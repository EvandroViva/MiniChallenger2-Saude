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
#import "ResultPesqTableViewController.h"
#import "ConsultaController.h"

@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *login;
@property (weak, nonatomic) IBOutlet UITextField *TFLogin;
@property (weak, nonatomic) IBOutlet UITextField *TFSenha;
@property NSString *UltimoCadastro;
@property NSString *UltimaSenha;
@property NSString *formatoData;
  
@property NSString *IDPaciente;

- (IBAction)BConfirma:(id)sender;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *Carregando;
@property (weak, nonatomic) IBOutlet UIButton *LoginButton;
@property (weak, nonatomic) IBOutlet UIButton *SignButton;

+ (NSMutableArray*)sharedEventos;
+ (LoginViewController*)sharedInstance;

@end
