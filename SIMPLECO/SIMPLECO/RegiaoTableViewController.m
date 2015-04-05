//
//  RegiaoTableViewController.m
//  SIMPLECO
//
//  Created by Liliane Bezerra Lima on 24/03/15.
//  Copyright (c) 2015 Liliane Bezerra Lima. All rights reserved.
//

#import "RegiaoTableViewController.h"

@interface RegiaoTableViewController ()

@end

//============================================================
#pragma mark - Atributos da Classe
//============================================================

@implementation RegiaoTableViewController
{
    EspecialidadesTableViewController *especialidade;
}

static RegiaoTableViewController *SINGLETON = nil;

+ (id)sharedInstance
{
    return SINGLETON;
}
//============================================================


//============================================================
#pragma mark - didLoad
//============================================================
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _bairros = [[NSArray alloc]init];
    _exibir = [[NSMutableArray alloc]init];
    _bairrosNorte = [[NSMutableArray alloc]init];
    _bairrosSul = [[NSMutableArray alloc]init];
    _bairrosLeste = [[NSMutableArray alloc]init];
    _bairrosOeste = [[NSMutableArray alloc]init];
    
    especialidade = [EspecialidadesTableViewController sharedInstance];
    
    [[MedicoController sharedInstance]buscarBairro:especialidade.especialidade AndComplete:^(NSArray* array){
        _bairros = array;
        NSLog(@"#BAIRROS NORTE %@",_bairrosNorte);
        NSLog(@"#BAIRROS SUL %@",_bairrosSul);
        NSLog(@"#BAIRROS LESTE %@",_bairrosLeste);
        NSLog(@"#BAIRROS OESTE %@\n\n\n\n",_bairrosOeste);
        [self.tableView reloadData];
    }];
        SINGLETON = self;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


//============================================================
#pragma mark - Configuracao da Table e Secoes
//============================================================
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    int count;
    switch (section) {
        case 0:
            count = _bairrosNorte.count;
            break;
            
        case 1:
            count = _bairrosSul.count;
            break;
            
        case 2:
            count = _bairrosLeste.count;
            break;
            
        case 3:
            count = _bairrosOeste.count;
            break;
            
        default:
            break;
    }
    return count;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString* regiao;
    switch (section) {
        case 0:
            regiao = @"Norte";
            break;
            
        case 1:
            regiao = @"Sul";
            break;
            
        case 2:
            regiao = @"Leste";
            break;
            
        case 3:
            regiao = @"Oeste";
            break;
            
        default:
            break;
    }
    return regiao;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RegiaoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CelulaRegiaoo" forIndexPath:indexPath];
    
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text = [_bairrosNorte objectAtIndex:indexPath.row];
            break;
    
        case 1:
            cell.textLabel.text = [_bairrosSul objectAtIndex:indexPath.row];
            break;
            
        case 2:
            cell.textLabel.text = [_bairrosLeste objectAtIndex:indexPath.row];
            break;
            
        case 3:
            cell.textLabel.text = [_bairrosOeste objectAtIndex:indexPath.row];
            break;
            
            default:
            break;
    }
    return cell;
}


//============================================================
#pragma mark - Passando Valor da Celula Selecionada
//============================================================
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
            _bairro = [_bairrosNorte objectAtIndex:indexPath.row];
            _regiao = @"Norte";
            NSLog(@"#BAIRRO SELECIONADO: %@\n\n\n",
                  _bairro = [_bairrosNorte objectAtIndex:indexPath.row]);
            break;
            
        case 1:
            _bairro = [_bairrosSul objectAtIndex:indexPath.row];
            _regiao = @"Sul";
            NSLog(@"#BAIRRO SELECIONADO: %@\n\n\n",
                  _bairro = [_bairrosSul objectAtIndex:indexPath.row]);
            break;
            
        case 2:
            _bairro = [_bairrosLeste objectAtIndex:indexPath.row];
            _regiao = @"Leste";
            NSLog(@"#BAIRRO SELECIONADO: %@\n\n\n",
                  _bairro = [_bairrosLeste objectAtIndex:indexPath.row]);
            break;
            
        case 3:
            _bairro = [_bairrosOeste objectAtIndex:indexPath.row];
            _regiao = @"Oeste";
            NSLog(@"#BAIRRO SELECIONADO: %@\n\n\n",
                  _bairro = [_bairrosOeste objectAtIndex:indexPath.row]);
            break;
            
        default:
            break;
    }
    [self.navigationController popViewControllerAnimated:YES];
}


@end
