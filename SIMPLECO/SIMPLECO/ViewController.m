//
//  ViewController.m
//  SIMPLECO
//
//  Created by Liliane Bezerra Lima on 24/03/15.
//  Copyright (c) 2015 Liliane Bezerra Lima. All rights reserved.
//

#import "ViewController.h"
#import "RegiaoTableViewController.h"

//============================================================
#pragma mark - Atributos da Classe
//============================================================

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

//============================================================
#pragma mark - DidLoad
//============================================================

- (void)viewDidLoad {
    [super viewDidLoad];
    [self Bordas];
    bit = false;
    [self Evento];
    SINGLETON = self;
    
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

//============================================================
#pragma mark - Layout dos Botões
//============================================================

-(void)Bordas
{
    [Bregiao.layer setCornerRadius:2];
    [Bregiao.layer setBorderWidth:2];
    [Bregiao.layer setBorderColor:[UIColor blackColor].CGColor];
    [Bregiao setBackgroundColor:[UIColor whiteColor]];
    
    [Bespecialidade.layer setCornerRadius:2];
    [Bespecialidade.layer setBorderWidth:2];
    [Bespecialidade.layer setBorderColor:[UIColor blackColor].CGColor];
    [Bespecialidade setBackgroundColor:[UIColor whiteColor]];
    
    [BBuscar.layer setCornerRadius:2];
    [BBuscar.layer setBorderWidth:2];
    [BBuscar.layer setBorderColor:[UIColor blackColor].CGColor];
    [BBuscar setBackgroundColor:[UIColor whiteColor]];
    
}

//============================================================
#pragma mark - Labels de pesquisa
//============================================================

-(void)viewWillAppear:(BOOL)animated
{
    
    nomeRegiao = [RegiaoTableViewController sharedInstance];
    if ([nomeRegiao.bairro isEqualToString:@""] || nomeRegiao.bairro == nil) {
        [Bregiao setTitle: @"Seleciona uma região" forState: UIControlStateNormal];
    } else {
        [Bregiao setTitle:nomeRegiao.bairro forState:UIControlStateNormal];
    }
    
//    _LRegiao.text = [[RegiaoTableViewController sharedInstance]bairro];
    
    NomeEspecialidade  = [EspecialidadesTableViewController sharedInstance];
    
    if ([NomeEspecialidade.especialidade isEqualToString:@""] || NomeEspecialidade.especialidade == nil) {
        [Bespecialidade setTitle:@"Seleciona uma especialidade" forState:UIControlStateNormal];
    } else {
        [Bespecialidade setTitle:NomeEspecialidade.especialidade forState:UIControlStateNormal];
    }
    
    
    
    if (bit == true && NomeEspecialidade.especialidade != nil) {
        [Bespecialidade.layer setBorderColor:[UIColor blackColor].CGColor];
    }
    
    if (bit == true && nomeRegiao.bairro != nil) {
        [Bregiao.layer setBorderColor:[UIColor blackColor].CGColor];
    }
    
}


//============================================================
#pragma mark - Botao Buscar/ verificacao de preenchimento
//============================================================
- (IBAction)BotaoBuscar:(id)sender {
    
    if (NomeEspecialidade.especialidade == nil)
    {
        NSLog(@"=====================================");
        NSLog(@" #BUSCA - Erro! (sem parametros)");
        NSLog(@"=====================================\n\n\n");
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

//============================================================
#pragma mark - Animacao
//============================================================
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
