//
//  ScheduleTableViewController.m
//  MiniChallenger2-Saude
//
//  Created by Evandro Remon Pulz Viva on 02/04/15.
//  Copyright (c) 2015 Evandro Remon Pulz Viva. All rights reserved.
//

#import "ScheduleTableViewController.h"

@interface ScheduleTableViewController ()
{
    Consultation *consulta, *consultaa;
    int bit;
}

@end

@implementation ScheduleTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    bit =0;
    
    [self BuscarInformacaoParse:[Medico sharedDoctor].parseObject.objectId AndComplete:^{
        
    }];

}

-(void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}
-(void)BuscarInformacaoParse:(NSString*)ID AndComplete:(void(^)(void))callback
{
    PFQuery *query = [PFQuery queryWithClassName:@"TipoConsulta"];
    [query whereKey:@"ObjectID" equalTo:ID];
    [query orderByAscending:@"HoraInicio"];
   // [query orderByAscending:@"MinInicio"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            NSLog(@"Successfully retrieved %lu MEDICOS.", (unsigned long)objects.count);
            for (PFObject *object in objects)
            {
                NSNumber *aux;
                consultaa = [[Consultation alloc]init];
                consultaa.HoraInicio = object[@"HoraInicio"];
                consultaa.MinInicio = object[@"MinInicio"];
                consultaa.HoraFinal = object[@"HoraFinal"];
                consultaa.MinFinal = object[@"MinFinal"];
                aux =object[@"numeroDiaSemana"];
                consultaa.indexSemana = [aux intValue];
                
                if ((int)consultaa.indexSemana == 1)
                    [[AddScheduleTableViewController sharedSDomingo]addObject:consultaa];
                if ((int)consultaa.indexSemana == 2)
                    [[AddScheduleTableViewController sharedSegunda]addObject:consultaa];
                if ((int)consultaa.indexSemana == 3)
                    [[AddScheduleTableViewController sharedTerca]addObject:consultaa];
                if ((int)consultaa.indexSemana == 4)
                    [[AddScheduleTableViewController sharedQuarta]addObject:consultaa];
                if ((int)consultaa.indexSemana == 5)
                    [[AddScheduleTableViewController sharedQuinta]addObject:consultaa];
                if ((int)consultaa.indexSemana == 6)
                    [[AddScheduleTableViewController sharedSexta]addObject:consultaa];
                if ((int)consultaa.indexSemana == 7)
                    [[AddScheduleTableViewController sharedSabado]addObject:consultaa];
             }
            
        }
        else {
            NSLog(@"Error: %@ %@", error, [error userInfo]);

        }
        callback();
        
    }];

    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 7;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
   
        
    if (section == 0 && [AddScheduleTableViewController sharedSegunda].count !=0)
        return @"Segunda";
  else if (section == 1 && [AddScheduleTableViewController sharedTerca].count !=0)
        return @"Terça";
   else if (section == 2 && [AddScheduleTableViewController sharedQuarta].count !=0)
        return @"Quarta";
  else if (section == 3 && [AddScheduleTableViewController sharedQuinta].count !=0)
        return @"Quinta";
  else if (section == 4 && [AddScheduleTableViewController sharedSexta].count !=0)
        return @"Sexta";
  else if (section == 5 && [AddScheduleTableViewController sharedSabado].count !=0)
        return @"Sabado";
  else if (section == 6 && [AddScheduleTableViewController sharedSDomingo].count !=0)
        return @"Domingo";
    else
        return @"";
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    
   // return 1;
    //return [AddScheduleTableViewController sharedHorarios].count;
    
    int count;
    switch (section) {
        case 0:
            count = (int)[AddScheduleTableViewController sharedSegunda].count;
            break;
            
        case 1:
            count =(int)[AddScheduleTableViewController sharedTerca].count;
            break;
            
        case 2:
            count = (int)[AddScheduleTableViewController sharedQuarta].count;
            break;
            
        case 3:
            count = (int)[AddScheduleTableViewController sharedQuinta].count;
            break;
            
        case 4:
            count = (int)[AddScheduleTableViewController sharedSexta].count;
            break;
            
        case 5:
            count = (int)[AddScheduleTableViewController sharedSabado].count;
            break;
            
        case 6:
            count = (int)[AddScheduleTableViewController sharedSDomingo].count;
            break;
            
        default:
            break;
    }
    return count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ScheduleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellSchedule" forIndexPath:indexPath];
    
    
    
    if (cell == nil)
    {
        cell = [[ScheduleTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellSchedule"];
    }
    
    switch (indexPath.section) {
        case 0:
            consulta = [AddScheduleTableViewController sharedSegunda][indexPath.row];
            //cell.LHora.text = consulta.HoraInicio;
            break;
            
        case 1:
            consulta = [AddScheduleTableViewController sharedTerca][indexPath.row];
            //cell.LHora.text = consulta.HoraInicio;
            break;
            
        case 2:
            consulta = [AddScheduleTableViewController sharedQuarta][indexPath.row];
            //cell.LHora.text = consulta.HoraInicio;
            break;
            
        case 3:
            consulta = [AddScheduleTableViewController sharedQuinta][indexPath.row];
            //cell.LHora.text = consulta.HoraInicio;
            break;
            
        case 4:
            consulta = [AddScheduleTableViewController sharedSexta][indexPath.row];
            //cell.LHora.text = consulta.HoraInicio;
            break;
            
        case 5:
            consulta = [AddScheduleTableViewController sharedSabado][indexPath.row];
           // cell.LHora.text = consulta.HoraInicio;
            break;
            
        case 6:
            consulta = [AddScheduleTableViewController sharedSDomingo][indexPath.row];
            //cell.LHora.text = consulta.HoraInicio;
            break;
            
        default:
            break;
    }

    NSString *junt1 =consulta.HoraInicio;
    NSString *junt2 = @":";
    NSString *junt3 = consulta.MinInicio;
    
    NSString *junt11 =consulta.HoraFinal;
    NSString *junt21 = @":";
    NSString *junt31 = consulta.MinFinal;
    
    junt1 = [junt1 stringByAppendingString:junt2];
    junt1 = [junt1 stringByAppendingString:junt3];
    
    junt11 = [junt11 stringByAppendingString:junt21];
    junt11 = [junt11 stringByAppendingString:junt31];
    
    
    cell.LHora.text = junt1;
    cell.LHoraFinal.text = junt11;
    
    
    
    //consulta= [AddScheduleTableViewController sharedHorarios][indexPath.row];

//[AddScheduleTableViewController sharedHorarios]
    
    
    
    
    return cell;
}


-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return true;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//-(IBAction)addButtonClick
//{
//    AddScheduleTableViewController *addScheduleTVC = [[AddScheduleTableViewController alloc] initWithNibName:@"AddScheduleTableViewController" bundle:nil];
//    [self.navigationController pushViewController:addScheduleTVC animated:true];
//}


@end
