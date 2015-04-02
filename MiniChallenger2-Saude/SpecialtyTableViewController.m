//
//  SpecialtyTableViewController.m
//  MiniChallenger2-Saude
//
//  Created by Evandro Remon Pulz Viva on 31/03/15.
//  Copyright (c) 2015 Evandro Remon Pulz Viva. All rights reserved.
//

#import "SpecialtyTableViewController.h"

@interface SpecialtyTableViewController ()

@end

@implementation SpecialtyTableViewController

static SpecialtyTableViewController *SINGLETON = nil;
+ (id)sharedInstance
{
    return SINGLETON;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // ESPECIALIDADES
    _especialidades = @[@"Cardiologista",@"Clínico Geral",@"Dentista/Ortodentista",@"Dermatologista",@"Endocrionologista",@"Endoscopia", @"Fisioterapeuta",@"Fonoaudiólogista",@"Ginecologista",@"Neurologista",@"Nutricionista", @"Nutrólogo", @"Obstetra", @"Oftamologista", @"Ortopedista", @"Otorrinolaringologista", @"Pediatra",@"Pneumologista",@"Psicólogo", @"Psiquiatra",@"Radiologista",@"Urologista"];
    
     self.navigationItem.leftBarButtonItem = self.editButtonItem;
    [self.view setBounds:CGRectMake(0, 400, [self.view.window bounds].size.width, [self.view.window bounds].size.height - 400)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Especialidades";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _especialidades.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SpecialtyTableViewCell"];
    
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"SpecialtyTableViewCell"];
    }
    
    cell.textLabel.text = _especialidades[indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _especialidadeSelecionada = _especialidades[indexPath.row];
    NSLog(@"ESPECIALIDADE SELECIONADA: %@",_especialidadeSelecionada);
    [self.navigationController popViewControllerAnimated:YES];
}


@end
