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

#pragma mark - SINGLETON
//============================================================
static RegiaoTableViewController *SINGLETON = nil;
static bool isFirstAccess = YES;

+ (id)sharedInstance
{
    return SINGLETON;
}
//============================================================


#pragma mark - didLoad
//============================================================
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // teste
    _bairrosNorte = @[@"Santana", @"Casa Verde", @"Tucuruvi", @"Carandiru"];
    _bairrosSul = @[@"Morumbi", @"Berrini", @"Granja Julieta"];
    _bairrosLeste = @[@"Itaquera", @"Brás", @"Mooca"];
    _bairrosOeste = @[@"Barra Funda", @"Lapa"];
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isFirstAccess = NO;
        SINGLETON = self;
    });
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
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

// numero de celulas por secao
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger count;
    switch (section) {
        case 0:
            count=[_bairrosNorte count];
            break;
        case 1:
            count=[_bairrosSul count];
            break;
        case 2:
            count=[_bairrosLeste count];
            break;
        case 3:
            count=[_bairrosOeste count];
            break;
        default:
            break;
    }
    return count;
}

// titulo das secoes
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString *title;
    switch (section) {
        case 0:
            title=@"Norte";
            break;
        case 1:
            title=@"Sul";
            break;
        case 2:
            title=@"Leste";
            break;
        case 3:
            title=@"Oeste";
            break;
        default:
            break;
    }
    return title;
}
//============================================================


#pragma mark - PREENCHER TABLE
//============================================================
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


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

}


#pragma mark - CELULA SELECIONADA
//============================================================
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
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
