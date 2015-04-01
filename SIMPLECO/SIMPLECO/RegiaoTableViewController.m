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
    
    especialidade = [EspecialidadesTableViewController sharedInstance];
    
    [[MedicoController sharedInstance]buscarBairro:especialidade.especialidade AndComplete:^(NSArray* array){
        _bairros = array;
        NSLog(@"array%@",array);
        NSString* anterior;
        NSString* atual;
        for (NSString *bairro in _bairros){
            anterior = atual;
            atual = bairro;
            NSLog(@"Bairro Anterior %@", anterior);
            NSLog(@"Bairro Atual %@\n\n\n", atual);
            if (anterior != atual){
                [_exibir addObject:atual];
            }
        }
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
    return 1;
}

// numero de celulas por secao
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _exibir.count;
}

// titulo das secoes
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Regiões";
}
//============================================================


#pragma mark - PREENCHER TABLE
//============================================================
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RegiaoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CelulaRegiaoo" forIndexPath:indexPath];
    cell.textLabel.text = [_exibir objectAtIndex:indexPath.row];
    return cell;
}
//============================================================


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

}


#pragma mark - CELULA SELECIONADA
//============================================================
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _bairro = [_exibir objectAtIndex:indexPath.row];
    [self.navigationController popViewControllerAnimated:YES];
}
//============================================================


@end
