//
//  CadastroViewController.m
//  SIMPLECO
//
//  Created by Liliane Bezerra Lima on 30/03/15.
//  Copyright (c) 2015 Liliane Bezerra Lima. All rights reserved.
//

#import "CadastroViewController.h"
#import <Parse/Parse.h>

@interface CadastroViewController ()

@end

@implementation CadastroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

#pragma mark Salvar dados

- (IBAction)Save:(id)sender {
    
    Usuario *usuario = [[Usuario alloc]init];
    [usuario setUsuario:[self.TextFieldUsuario text]];
    [usuario setEmail:[self.TextFielEmail text]];
    [usuario setSenha:[self.TextFieldSenha text]];
    
    PFObject*nada=[PFObject objectWithClassName:@"Paciente"];
    nada[@"nome"]=self.TextFieldNome.text;
    [nada saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            // The object has been saved.
        } else {
            // There was a problem, check error.description
        }
    }];
    
    [usuario setPaciente:nada];
    
    
    [UsuarioDAO signinWithUser:usuario AndComplete: ^(bool succeeded, NSError* error){
        
        if (succeeded) {
            [self.navigationController popViewControllerAnimated:YES];
        } else {
            NSString *errorString = [error userInfo][@"error"];
            [[[UIAlertView alloc] initWithTitle:@"Erro" message: errorString delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil] show];
        }
        
    }];
    
   
}


#pragma mark Clicar na tela e sair teclado

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_TextFieldSenha resignFirstResponder];
    [_TextFieldUsuario resignFirstResponder];
    [_TextFielEmail resignFirstResponder];
}
@end
