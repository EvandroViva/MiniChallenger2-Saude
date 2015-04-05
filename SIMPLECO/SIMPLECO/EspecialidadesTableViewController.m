//
//  EspecialidadesTableViewController.m
//  SIMPLECO
//
//  Created by Liliane Bezerra Lima on 24/03/15.
//  Copyright (c) 2015 Liliane Bezerra Lima. All rights reserved.
//

#import "EspecialidadesTableViewController.h"

@interface EspecialidadesTableViewController ()

@end

//============================================================
#pragma mark - Atributos da Classe
//============================================================

@implementation EspecialidadesTableViewController
{
    RegiaoTableViewController *regiao;
}

@synthesize listaEspecialidade;
@synthesize especialidade;

static EspecialidadesTableViewController *SINGLETON = nil;

+ (id)sharedInstance
{
    return SINGLETON;
}

//============================================================
#pragma mark - DidLoad
//============================================================
- (void)viewDidLoad {
    [super viewDidLoad];
    
    listaEspecialidade = @[@"Cardiologista",@"Clínico Geral",@"Dentista/Ortodentista",@"Dermatologista",@"Endocrionologista",@"Endoscopia",@"Fisioterapeuta",@"Fonoaudiólogista",@"Ginecologista",@"Neurologista",@"Nutricionista",@"Nutrólogo",@"Obstetra",@"Oftamologista",@"Ortopedista",@"Otorrinolaringologista",@"Pediatra",@"Pneumologista",@"Psicólogo",@"Psiquiatra",@"Radiologista",@"Urologista"];
    
    regiao = [RegiaoTableViewController sharedInstance];
    _especialidades = [[NSArray alloc]init];
    _exibir = [[NSMutableArray alloc]init];
    [self.Carregando setHidden:NO];
    [[MedicoController sharedInstance]buscarEspecialidade:regiao.bairro AndComplete:^(NSArray *array){
        _especialidades = array;
        NSString* anterior;
        NSString* atual;
        for (NSString* especialidade in _especialidades){
            anterior = atual;
            atual = especialidade;
            if (anterior != atual){
                [_exibir addObject:atual];
            }
        }
        [self.tableView reloadData];
        NSLog(@"#ESPECIALIDADES ENCONTRADAS SEM REPETICAO: %@\n\n\n\n", _exibir);
    }];
    [self.tableView reloadData];

        SINGLETON = self;
    
    CAGradientLayer *background = [CAGradientLayer layer];
    background.colors = @[(id)[UIColor colorWithRed:228/255.0 green:255/255.0 blue:255/255.0 alpha:1.0].CGColor, (id)[UIColor colorWithRed:148/255.0 green:238/255.0 blue:255/255.0 alpha:1.0].CGColor];
    background.locations = @[@0.2,@1.0];
    background.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    [self.view.layer insertSublayer:background atIndex:0];
    
}

-(void)viewDidAppear:(BOOL)animated
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


//============================================================
#pragma mark - Configuracao da Table e Sections
//============================================================

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   
    return _exibir.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    EspecialidadesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CelulaEspecialidades" forIndexPath:indexPath];
    
    cell.Label_Especialidades.text =(NSString*) _exibir[indexPath.row];
    
    return cell;
}


//============================================================
#pragma mark - Passar valores ao selecionar celula
//============================================================
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ViewController *proximaView = segue.destinationViewController;
    proximaView.especialidade = especialidade;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.especialidade =_exibir[indexPath.row];
    NSLog(@"#ESPECIALIDADE SELECIONADA: %@\n\n\n\n\n",
          self.especialidade =_exibir[indexPath.row]);
    [self.navigationController popViewControllerAnimated:YES];
}


@end
