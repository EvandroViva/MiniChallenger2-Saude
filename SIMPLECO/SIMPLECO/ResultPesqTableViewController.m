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

@implementation ResultPesqTableViewController
@synthesize index;

static ResultPesqTableViewController *SINGLETON = nil;

+ (id)sharedInstance
{
    return SINGLETON;
}

- (void)viewDidLoad {
    [super viewDidLoad];
 
    ArrayTeste = @[@"Clinica X", @"Clinica Y", @"Clinica Z", @"Clinica W"];
     SINGLETON = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _medicos.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ResultPesqTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CelulaResultPesq" forIndexPath:indexPath];
    
    if (cell == nil)
    {
        cell = [[ResultPesqTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CelulaResultPesq"];
    }
    
    cell.LabelMedico.text = [_medicos[indexPath.row]nome];
    cell.LabelEndereco.text = [_medicos[indexPath.row]endereco];
    cell.LabelDetalhes.text = [_medicos[indexPath.row]bairro];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    index = indexPath.row;
    [self performSegueWithIdentifier:@"showConsulta" sender:self] ;
}

#pragma mark - Navigation

//[self.MapView setDelegate:self];

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
