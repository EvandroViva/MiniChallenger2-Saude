//
//  ResultPesqTableViewController.m
//  SIMPLECO
//
//  Created by Liliane Bezerra Lima on 24/03/15.
//  Copyright (c) 2015 Liliane Bezerra Lima. All rights reserved.
//

#import "ResultPesqTableViewController.h"

@interface ResultPesqTableViewController ()


@end

//============================================================
#pragma mark - Atributos da Classe
//============================================================

@implementation ResultPesqTableViewController
@synthesize index;
@synthesize medicoSelecionado;

static ResultPesqTableViewController *SINGLETON = nil;

+ (id)sharedInstance
{
    return SINGLETON;
}


//============================================================
#pragma mark - DidLoad
//============================================================
- (void)viewDidLoad {
    [super viewDidLoad];
    medicoSelecionado = [[Medico alloc]init];
    NSString* especialidade = [[[ViewController sharedInstance]LEspecialidade]text];
    NSString* bairro = [[[ViewController sharedInstance]LRegiao]text];
    
    _medicos = [[NSMutableArray alloc]init];
    
    [[MedicoController sharedInstance]buscarMedicos:especialidade andRegiao:bairro AndComplete:^{
        [self.tableView reloadData];
    }];
    
     SINGLETON = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


//============================================================
#pragma mark - Configuracao da table e sections
//============================================================
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _medicos.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Celula"];
  
    UIButton *button= [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    [button setFrame:CGRectMake(300, 30, 30, 30)];
    [button addTarget:self action:@selector(buttonPressedAction:) forControlEvents:UIControlEventTouchUpInside];
    [cell addSubview:button];
    [button setTag:indexPath.row];

    UILabel *LMedico = [[UILabel alloc]init];
    [LMedico setFrame:CGRectMake(40, 20, 170, 20)];
    [cell addSubview:LMedico];
    
    UILabel *LEndereco = [[UILabel alloc]init];
    [LEndereco setFrame:CGRectMake(40, 50, 170, 20)];
    [cell addSubview:LEndereco];
    
    UILabel *LDetalhe = [[UILabel alloc]init];
    [LDetalhe setFrame:CGRectMake(40, 80, 170, 20)];
    [cell addSubview:LDetalhe];
  
   LMedico.text = [_medicos[indexPath.row]nome];
    LEndereco.text = [_medicos[indexPath.row]endereco];
    LDetalhe.text = [_medicos[indexPath.row]bairro];
    return cell;
}


//============================================================
#pragma mark - Passando valores da celula selecionada e Botao de Infos
//============================================================
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"showConsulta" sender:self] ;
    medicoSelecionado = _medicos[indexPath.row];
}

- (void)buttonPressedAction:(id)sender
{
    UIButton *button = (UIButton *)sender;
    medicoSelecionado = _medicos[button.tag];
    [self performSegueWithIdentifier:@"showInfo" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
}


@end
