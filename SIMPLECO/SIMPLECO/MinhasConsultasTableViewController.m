//
//  MinhasConsultasTableViewController.m
//  SIMPLECO
//
//  Created by Liliane Bezerra Lima on 24/03/15.
//  Copyright (c) 2015 Liliane Bezerra Lima. All rights reserved.
//

#import "MinhasConsultasTableViewController.h"

@interface MinhasConsultasTableViewController ()
{
    ViewController *viewC;
    ResultPesqTableViewController *medSelecionado;
}


@end

@implementation MinhasConsultasTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    viewC = [ViewController sharedInstance];
     _teste = [NSMutableArray arrayWithObjects:
               @"Dentista",@"Medico", nil];
    _evento = [EKEvent eventWithEventStore:viewC.eventStore];
   
    
}
-(void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [[LoginViewController sharedEventos] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
    
    MinhasConsultasTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CelulaMinhasConsultas" forIndexPath:indexPath];
    
   // PSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PSTableCell" forIndexPath:indexPath];
    
    
    if (cell == nil)
    {
        cell = [[MinhasConsultasTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CelulaMinhasConsultas"];
    }
    
    // Configure the cell...
    
//    =================================
//    |      Consultas via Parse      |
//    =================================
    PFUser*user=[PFUser currentUser];
    PFQuery *query = [PFQuery queryWithClassName:@"Consulta"];
//    [query whereKey:@"p_paciente" equalTo:user];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        NSLog(@"inicio dados");
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %lu consults.", (unsigned long)objects.count);
            // Do something with the found objects
            for (PFObject *object in objects) {
                NSLog(@"%@", object.parseClassName);
                NSLog(@"%@", object.allKeys);
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
//    ==============FIM================
    _evento = [LoginViewController sharedEventos][indexPath.row];
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    [format setDateFormat:@" dd /MM"];
    NSString *formatoData = [format stringFromDate:_evento.startDate];
    
    NSDateFormatter *format2 = [[NSDateFormatter alloc]init];
    [format2 setDateFormat:@" HH:mm"];
    NSString *formatoHora = [format2 stringFromDate:_evento.startDate];
    medSelecionado = [ResultPesqTableViewController sharedInstance];
    
    cell.LabelData.text= formatoData;
    cell.LabelHora.text=formatoHora;
    
    NSLog(@"O que mostra??%@",medSelecionado.medicoSelecionado.especialidade);
    cell.LabelConsulta.text = medSelecionado.medicoSelecionado.especialidade;
    cell.LabelDetalhes.text =medSelecionado.medicoSelecionado.endereco;
    
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [[LoginViewController sharedEventos] removeObjectAtIndex:indexPath.row];
        NSLog(@"Deletei %li, %li",(long)indexPath.row, (long)indexPath.section);
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];

        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}



// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}



// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [self showCalendarOnDate:_evento.startDate];
    
}

#pragma mark - Chama o Calendário do Iphone
- (void)showCalendarOnDate:(NSDate *)date
{
    // calc time interval since 1 January 2001, GMT
    NSInteger interval = [date timeIntervalSinceReferenceDate];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"calshow:%ld", interval]];
    [[UIApplication sharedApplication] openURL:url];
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
