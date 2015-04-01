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

@implementation RegiaoTableViewController
{
    EspecialidadesTableViewController *especialidade;
}

#pragma mark - SINGLETON
//============================================================
static RegiaoTableViewController *SINGLETON = nil;


+ (id)sharedInstance
{
    return SINGLETON;
}
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
        NSLog(@"array%@",array);
        NSLog(@"NORTE %@",_bairrosNorte);
        NSLog(@"SUL %@",_bairrosSul);
        NSLog(@"LESTE %@",_bairrosLeste);
        NSLog(@"OESTE %@",_bairrosOeste);
//        NSString* anterior;
//        NSString* atual;
//        for (NSString *bairro in _bairros){
//            anterior = atual;
//            atual = bairro;
//            NSLog(@"Bairro Anterior %@", anterior);
//            NSLog(@"Bairro Atual %@\n\n\n", atual);
//            if (anterior != atual){
//                [_exibir addObject:atual];
//            }
//        }
        [self.tableView reloadData];
    }];
        SINGLETON = self;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(BOOL) prefersStatusBarHidden
{
    return YES;
}
//============================================================


#pragma mark - SECOES
//============================================================
// numero de secoes
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

// numero de celulas por secao
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

// titulo das secoes
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
//============================================================


#pragma mark - PREENCHER TABLE
//============================================================
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RegiaoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CelulaRegiaoo" forIndexPath:indexPath];
//    cell.textLabel.text = [_exibir objectAtIndex:indexPath.row];
    
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


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

}


#pragma mark - CELULA SELECIONADA
//============================================================
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    _bairro = [_exibir objectAtIndex:indexPath.row];
    switch (indexPath.section) {
        case 0:
            _bairro = [_bairrosNorte objectAtIndex:indexPath.row];
            _regiao = @"Norte";
            break;
            
        case 1:
            _bairro = [_bairrosSul objectAtIndex:indexPath.row];
            _regiao = @"Sul";
            break;
            
        case 2:
            _bairro = [_bairrosLeste objectAtIndex:indexPath.row];
            _regiao = @"Leste";
            break;
            
        case 3:
            _bairro = [_bairrosOeste objectAtIndex:indexPath.row];
            _regiao = @"Oeste";
            break;
            
        default:
            break;
    }
    [self.navigationController popViewControllerAnimated:YES];
}
//============================================================


@end
