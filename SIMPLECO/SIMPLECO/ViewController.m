//
//  ViewController.m
//  SIMPLECO
//
//  Created by Liliane Bezerra Lima on 24/03/15.
//  Copyright (c) 2015 Liliane Bezerra Lima. All rights reserved.
//

#import "ViewController.h"
#import "RegiaoTableViewController.h"

@interface ViewController ()
{
    NSString *nome;
    EspecialidadesTableViewController *NomeEspecialidade;
    RegiaoTableViewController* nomeRegiao;
    BOOL bit, bitEspecialidade, bitRegiao;
}


@end

@implementation ViewController
@synthesize Bespecialidade;
@synthesize Bregiao;
@synthesize BBuscar;
@synthesize especialidade;
@synthesize permissaoEvento;
@synthesize eventStore;


static ViewController *SINGLETON = nil;


+ (id)sharedInstance
{
    return SINGLETON;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self Bordas];
    bit = false;
    [self Evento];
    SINGLETON = self;

    
}

#pragma mark - Layout dos Botões

-(void)Bordas
{
    [Bregiao.layer setCornerRadius:5];
    [Bregiao.layer setBorderWidth:2];
    [Bregiao.layer setBorderColor:[UIColor blackColor].CGColor];
    [Bregiao setBackgroundColor:[UIColor whiteColor]];
    
    [Bespecialidade.layer setCornerRadius:5];
    [Bespecialidade.layer setBorderWidth:2];
    [Bespecialidade.layer setBorderColor:[UIColor blackColor].CGColor];
    [Bespecialidade setBackgroundColor:[UIColor whiteColor]];
    
    [BBuscar.layer setCornerRadius:5];
    [BBuscar.layer setBorderWidth:2];
    [BBuscar.layer setBorderColor:[UIColor blackColor].CGColor];
    [BBuscar setBackgroundColor:[UIColor whiteColor]];
    
}

#pragma mark - Labels de pesquisa

-(void)viewWillAppear:(BOOL)animated
{
    
    nomeRegiao = [RegiaoTableViewController sharedInstance];
    _LRegiao.text = nomeRegiao.bairro;
    _LRegiao.text = [[RegiaoTableViewController sharedInstance]bairro];
    
    NomeEspecialidade  = [EspecialidadesTableViewController sharedInstance];
    _LEspecialidade.text = NomeEspecialidade.especialidade;
    
    if (bit == true && NomeEspecialidade.especialidade != nil) {
        [Bespecialidade.layer setBorderColor:[UIColor blackColor].CGColor];
    }
    
    if (bit == true && nomeRegiao.bairro != nil) {
        [Bregiao.layer setBorderColor:[UIColor blackColor].CGColor];
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Botao Buscar/ verificacao de preenchimento

- (IBAction)BotaoBuscar:(id)sender {
    
    if (NomeEspecialidade.especialidade == nil)
    {
        NSLog(@"Erro");
        [Bespecialidade.layer setBorderColor:[UIColor redColor].CGColor];
        bit = true;
        [self Animacao:Bespecialidade];
    }
    if (nomeRegiao.bairro == nil)
    {
        [Bregiao.layer setBorderColor:[UIColor redColor].CGColor];
        bit = true;
        [self Animacao:Bregiao];
    }
    if(NomeEspecialidade.especialidade != nil && nomeRegiao.bairro != nil)
    {
        [self performSegueWithIdentifier:@"showResultPesq" sender:self];
        NomeEspecialidade.especialidade = nil;
        nomeRegiao.bairro = nil;
        bit = false;
    }
}

#pragma mark - Animacao
-(void)Animacao:(UIButton *)button
{
    [UIView animateWithDuration:0.1
                          delay:0.1
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         button.transform =CGAffineTransformMakeTranslation(self.view.frame.origin.x+20, 0);
                     }completion:^(BOOL finished){
                     }];
    [UIView animateWithDuration:0.1
                          delay:0.2
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         button.transform =CGAffineTransformMakeTranslation(self.view.frame.origin.x-20, 0);
                     }completion:^(BOOL finished){
                     }];
    [UIView animateWithDuration:0.1
                          delay:0.3
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         button.transform =CGAffineTransformMakeTranslation(self.view.frame.origin.x+20, 0);
                     }completion:^(BOOL finished){
                     }];
    [UIView animateWithDuration:0.1
                          delay:0.4
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         button.transform =CGAffineTransformMakeTranslation(0, 0);
                     }completion:^(BOOL finished){
                     }];
    
}

-(void)Evento
{
    eventStore = [[EKEventStore alloc]init];
    
    //Check if iOS6 or later is installed on user's device *******************
    if([eventStore respondsToSelector:@selector(requestAccessToEntityType:completion:)]) {
        
        //Request the access to the Calendar
        [eventStore requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted,NSError* error){
            permissaoEvento = granted;
        }
         ];}
}
@end
