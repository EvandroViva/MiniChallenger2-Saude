//
//  CadastroViewController.h
//  SIMPLECO
//
//  Created by Liliane Bezerra Lima on 30/03/15.
//  Copyright (c) 2015 Liliane Bezerra Lima. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Usuario.h"
#import "UsuarioDAO.h"


@interface CadastroViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *TextFielEmail;
@property (weak, nonatomic) IBOutlet UITextField *TextFieldUsuario;
@property (weak, nonatomic) IBOutlet UITextField *TextFieldSenha;
- (IBAction)Save:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *TextFieldNome;
@property (weak, nonatomic) IBOutlet UITextField *TextFieldTelefone;

@end
