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



- (void)viewDidLoad {
    [super viewDidLoad];

    
    listaEspecialidade = @[@"Cardiologista",@"Clínico Geral",@"Dentista/Ortodentista",@"Dermatologista",@"Endocrionologista",@"Endoscopia",@"Fisioterapeuta",@"Fonoaudiólogista",@"Ginecologista",@"Neurologista",@"Nutricionista",@"Nutrólogo",@"Obstetra",@"Oftamologista",@"Ortopedista",@"Otorrinolaringologista",@"Pediatra",@"Pneumologista",@"Psicólogo",@"Psiquiatra",@"Radiologista",@"Urologista"];
    
    regiao = [RegiaoTableViewController sharedInstance];
    _especialidades = [[NSArray alloc]init];
    _exibir = [[NSMutableArray alloc]init];
    
    [[MedicoController sharedInstance]buscarEspecialidade:regiao.bairro AndComplete:^(NSArray *array){
  
        _especialidades = array;
        NSLog(@"array%@",array);
        NSString* anterior;
        NSString* atual;
        for (NSString *especialidade in _especialidades){
            anterior = atual;
            atual = especialidade;
            NSLog(@"Especialidade Anterior %@", anterior);
            NSLog(@"Especialidade Atual %@\n\n\n", atual);
            if (anterior != atual){
                [_exibir addObject:atual];
            }
        }
        [self.tableView reloadData];
    }];

        SINGLETON = self;
    
  
}

-(void)viewWillAppear:(BOOL)animated
{
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return _exibir.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    EspecialidadesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CelulaEspecialidades" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.Label_Especialidades.text =(NSString*) _exibir[indexPath.row];
    return cell;
}


//Configurações para passar os dados para a proxima view



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    ViewController *proximaView = segue.destinationViewController;
    proximaView.especialidade = especialidade;
    
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.especialidade =_exibir[indexPath.row];
    [self.navigationController popViewControllerAnimated:YES];
}



@end
