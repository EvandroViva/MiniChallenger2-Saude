//
//  LoginViewController.m
//  SIMPLECO
//
//  Created by Liliane Bezerra Lima on 26/03/15.
//  Copyright (c) 2015 Liliane Bezerra Lima. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
{
    ViewController *viewController;
    ConsultaViewController *dataConsulta;
    TabBarController *tabbar;
    NSUserDefaults *defaults;
}

@end

@implementation LoginViewController

@synthesize login;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.Carregando setHidden:YES];

    [self Default];


}

#pragma mark - Usar Default
-(void)Default
{
    defaults = [[NSUserDefaults alloc]init];
    
    if ([[defaults objectForKey:@"SalvarDados"]isEqual:@""])
        [_TFLogin setText:@""];
    else
        [_TFLogin setText:[defaults objectForKey:@"SalvarDados"]];
    
    if ([[defaults objectForKey:@"SalvarSenha"]isEqual:@""])
        [_TFSenha setText:@""];
    else
        [_TFSenha setText:[defaults objectForKey:@"SalvarSenha"]];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Clicar na tela e sair teclado
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_TFLogin resignFirstResponder];
     [_TFSenha resignFirstResponder];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Botão Confirma/ Confirmar Login e Senha

- (IBAction)BConfirma:(id)sender {
    
    //[self.Carregando
    
    
    //Confirmação de Login
    [self.Carregando setHidden:NO];
    
    [PFUser logInWithUsernameInBackground:[self.TFLogin text] password:[self.TFSenha text]
                                    block:^(PFUser *user, NSError *error)
    {
                                       
                                        if (user) {
                                            [self.Carregando setHidden:YES];
                                            
                                            NSLog(@"Resp?%@",[user objectForKey:@"emailVerified"]);
                                            if ([[user objectForKey:@"emailVerified"] boolValue]) {
                                               
                                                _UltimoCadastro = [self.TFLogin text];
                                                [defaults setObject:_UltimoCadastro forKey:@"SalvarDados"];
                                                
                                                _UltimaSenha =[self.TFSenha text];
                                                [defaults setObject:_UltimaSenha forKey:@"SalvarSenha"];
                                                
                                                //Criar Evento no Calendário
                                                viewController = [ViewController sharedInstance];
                                                dataConsulta = [ConsultaViewController sharedInstance];
                                                [self PermissaoEvento];
                                                [self CriarEvento:viewController.eventStore];
                                                [self.tabBarController setSelectedIndex:1];
                                                [self performSegueWithIdentifier:@"showMinhasConsultas" sender:self] ;
                                                
                                                
                                            }
                                            else{
                                                 NSString *message = @"Por Favor olhar sua caixa de email!";
                                                 UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Email não Confirmado." message:message delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil,nil];
                                                [alertView show];
                                            }
                                            
                                        } else {
                                            [self.Carregando setAlpha:1];
                                            [self.Carregando setHidden:YES];
                                            NSString *message = @"E-mail e/ou senha estão inválidos.";
                                            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Usuário Inválido" message:message delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil,nil];
                                            [alertView show];
                                            // The login failed. Check error to see why.
                                        }
                                    }];
}


#pragma mark - Permissao para salvar evento Calendario

-(void)PermissaoEvento
{
    
    NSLog(@" Valor = %s",viewController.permissaoEvento ? "true" : "false");

    if(!viewController.permissaoEvento){
        NSString *message = @"Não será Possivel Gravar evento no Calendário, pois a permissão esta negada";
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Atenção" message:message delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil,nil];
            [alertView show];
        }

    else{
        NSString *message = @"Compromisso salvo no calendário";
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Sucesso" message:message delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil,nil];
        [alertView show];
        }
}


#pragma mark criando evento

-(BOOL)CriarEvento:(EKEventStore*)eventStore
{
    EKEvent *event = [EKEvent eventWithEventStore:eventStore];
    event.title = @"Eu fiz o evento!";
    
    event.startDate = dataConsulta.dataSelecionada;
    NSLog(@"Data = %@",dataConsulta.dataSelecionada);
    event.endDate = [event.startDate dateByAddingTimeInterval:3600];
    event.calendar = [eventStore defaultCalendarForNewEvents];
    
    NSError *error;
    [eventStore saveEvent:event span:EKSpanThisEvent error:&error];
    
    if (error) {
        NSLog(@"Event Store Error: %@",[error localizedDescription]);
        return NO;
    }else{
        return YES;
    }
}
@end
