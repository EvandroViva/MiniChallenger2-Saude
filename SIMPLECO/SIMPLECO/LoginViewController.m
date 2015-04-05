//
//  LoginViewController.m
//  SIMPLECO
//
//  Created by Liliane Bezerra Lima on 26/03/15.
//  Copyright (c) 2015 Liliane Bezerra Lima. All rights reserved.
//

#import "LoginViewController.h"
#import "ConsultaController.h"
#import "Paciente.h"

static NSMutableArray *EventoSalvo;

static bool isFirstAccess = YES;

@interface LoginViewController ()
{
    ViewController *viewController;
    ConsultaViewController *dataConsulta;
    TabBarController *tabbar;
    NSUserDefaults *defaults;

    ResultPesqTableViewController* med;
    ConsultaController* personaC;

    ResultPesqTableViewController *medSelecionado;
    BOOL salvaEvento,permiEvento;
    
    Paciente *paciente;
    PFUser* usuario;
    NSArray *pacientes;
    
    


}

@end

@implementation LoginViewController

@synthesize login;

static LoginViewController *SINGLETON = nil;


+ (id)sharedInstance
{
    return SINGLETON;
    
}

+ (NSMutableArray*)sharedEventos
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isFirstAccess = NO;
        EventoSalvo = [[NSMutableArray alloc]init];
    });
    
    return EventoSalvo;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self.Carregando setHidden:YES];
    
    [self Default];
    SINGLETON = self;
    permiEvento = FALSE;
    salvaEvento = FALSE;
    pacientes = [[NSArray alloc]init];
    paciente = [[Paciente alloc]init];
    usuario = [[PFUser alloc]init];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(segueShowConsultas) name:@"InformacoesEnviadas" object:nil];
    medSelecionado = [ResultPesqTableViewController sharedInstance];
    
    [self.LoginButton.layer setCornerRadius:5];
    [self.LoginButton.layer setBorderWidth:1];
    [self.LoginButton.layer setBorderColor:[UIColor blackColor].CGColor];
    [self.LoginButton.layer setBackgroundColor:[UIColor whiteColor].CGColor];
    
    [self.SignButton.layer setCornerRadius:5];
    [self.SignButton.layer setBorderWidth:1];
    [self.SignButton.layer setBorderColor:[UIColor blackColor].CGColor];
    [self.SignButton.layer setBackgroundColor:[UIColor whiteColor].CGColor];


    CAGradientLayer *background = [CAGradientLayer layer];
    background.colors = @[(id)[UIColor colorWithRed:0 green:201/255.0 blue:255/255.0 alpha:1.0].CGColor, (id)[UIColor colorWithRed:0/255.0 green:70/255.0 blue:163/255.0 alpha:1.0].CGColor];
    background.locations = @[@0.2,@1.0];
    background.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    [self.view.layer insertSublayer:background atIndex:0];
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
    
// ================================================================================
//                      CONFIRMAÇÃO DO LOGIN
//=================================================================================
    
    [self.Carregando setHidden:NO];
    
    [PFUser logInWithUsernameInBackground:[self.TFLogin text] password:[self.TFSenha text]
                                    block:^(PFUser *user, NSError *error)
     {
         if (user) {
             NSLog(@"Object =%@", user.objectId);
             [self.Carregando setHidden:YES];
             NSLog(@"Resp?%@",[user objectForKey:@"emailVerified"]);
             if ([[user objectForKey:@"emailVerified"] boolValue])
             {
                 _UltimoCadastro = [self.TFLogin text];
                 [defaults setObject:_UltimoCadastro forKey:@"SalvarDados"];
                 
                 _UltimaSenha =[self.TFSenha text];
                 [defaults setObject:_UltimaSenha forKey:@"SalvarSenha"];
                 
                 [[ConsultaController sharedInstance]BuscarPaciente:user.email andUser:user.username AndComplete:^(NSArray* array)
                  {
                      paciente = array[0];
                      
                      viewController = [ViewController sharedInstance];
                      dataConsulta = [ConsultaViewController sharedInstance];
                      [self PermissaoEvento];
                      if (salvaEvento == FALSE)
                          [self CriarEvento:viewController.eventStore];
                      [self.tabBarController setSelectedIndex:1];
                      [self.navigationController popToRootViewControllerAnimated:YES];
                  }];
                // usuario = user;
                 
//======================================================================================
//                   CRIAR EVENTO NO CALENDÁRIO
//======================================================================================

               

             }
             else
             {
                 NSString *message = @"Por Favor olhar sua caixa de email!";
                 UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Email não Confirmado." message:message delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil,nil];
                 [alertView show];

             }
         }
         
         else{
             [self.Carregando setAlpha:1];
             [self.Carregando setHidden:YES];
             NSString *message = @"E-mail e/ou senha estão inválidos.";
             UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Usuário Inválido" message:message delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil,nil];
             [alertView show];

             
         }
         
     }];

}


- (void)segueShowConsultas {
    [self PermissaoEvento];
    [self CriarEvento:viewController.eventStore];
   
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
        if (permiEvento == FALSE)
        {
            
        
        NSString *message = @"Compromisso salvo no calendário";
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Sucesso" message:message delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil,nil];
        [alertView show];
            permiEvento = TRUE;
        }
        }
}


#pragma mark criando evento

-(BOOL)CriarEvento:(EKEventStore*)eventStore
{
    
    NSString *titulo = medSelecionado.medicoSelecionado.especialidade;
    EKEvent *event = [EKEvent eventWithEventStore:eventStore];
   // event.title = medSelecionado.medicoSelecionado.especialidade;
    event.title = titulo;
    event.startDate = dataConsulta.dataSelecionada;
    NSLog(@"Data = %@",dataConsulta.dataSelecionada);
    event.endDate = [event.startDate dateByAddingTimeInterval:3600];
    event.calendar = [eventStore defaultCalendarForNewEvents];
    salvaEvento = TRUE;
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    [format setDateFormat:@" dd/MM/yyyy"];
    NSString *formatoData = [format stringFromDate:dataConsulta.dataSelecionada];
    
    [[LoginViewController sharedEventos] addObject:event];
    NSError *error;
    [eventStore saveEvent:event span:EKSpanThisEvent error:&error];
    
    if (error) {
        NSLog(@"Event Store Error: %@",[error localizedDescription]);
        return NO;
    }else{
        
        
        
        [[ConsultaController sharedInstance]MarcouConsultaRetirarVagaParese:formatoData andHora:dataConsulta.Hora andMin:dataConsulta.Minuto andID:medSelecionado.medicoSelecionado.objectID andIDP:paciente.objectID AndComplete:^{
            [self.tabBarController setSelectedIndex:1];
            [self.navigationController popToRootViewControllerAnimated:YES];
            
       }];
       

        return YES;
    }
}
@end
