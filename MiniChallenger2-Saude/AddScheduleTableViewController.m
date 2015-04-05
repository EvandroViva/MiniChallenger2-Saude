//
//  AddScheduleTableViewController.m
//  MiniChallenger2-Saude
//
//  Created by Evandro Remon Pulz Viva on 02/04/15.
//  Copyright (c) 2015 Evandro Remon Pulz Viva. All rights reserved.
//

#import "AddScheduleTableViewController.h"

static NSString* daysWeek[] = {@"Dom",@"Seg",@"Ter",@"Qua",@"Qui",@"Sex",@"Sáb"};

@interface AddScheduleTableViewController ()

@end

@implementation AddScheduleTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.schedule = [[Schedule alloc] init];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    UIBarButtonItem *done = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(DoneClick:)];
    [self.navigationItem setRightBarButtonItem:done];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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




#pragma mark - Table view delegate


// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
//    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
//    [self.navigationController pushViewController:detailViewController animated:YES];

}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"showPopover"]) {
        UINavigationController *destNav = segue.destinationViewController;
        UIPopoverPresentationController *popPC = destNav.popoverPresentationController;
        popPC.delegate = self;
    }
}

- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
    return UIModalPresentationNone;
}

-(void)popoverPresentationControllerDidDismissPopover:(UIPopoverPresentationController *)popoverPresentationController
{
    if ([[popoverPresentationController.presentedViewController class] isSubclassOfClass: [WeeklyTableViewController class]]) {
        WeeklyTableViewController *Controller = (id)popoverPresentationController.presentedViewController;
        self.schedule.daysRepeat = Controller.days;
        NSString *str = @"";
        for (int i = 0; i<7; i++) {
            if ([Controller.days[i] isEqualToNumber:@1]) {
                str = [NSString stringWithFormat:@"%@ %@",str,daysWeek[i]];
            }
        }
        [self.repeatLabel setText:str];
        
    }
    if ([[popoverPresentationController.presentedViewController class] isSubclassOfClass: [DateTimeViewController class]]) {
        DateTimeViewController *Controller = (id)popoverPresentationController.presentedViewController;
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"dd MMM yyyy   hh:mm a"];
        self.schedule.starts = Controller.date.date;
        [self.startsLabel setText:[NSString stringWithFormat:@"%@",[formatter stringFromDate:Controller.date.date]]];
    }
    if ([[popoverPresentationController.presentedViewController class] isSubclassOfClass: [TimeViewController class]]) {
        TimeViewController *Controller = (id)popoverPresentationController.presentedViewController;
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"hh:mm a"];
        [self.endsLabel setText: [formatter stringFromDate: Controller.date.date]];
        self.schedule.ends = Controller.date.date;
    }
    if ([[popoverPresentationController.presentedViewController class] isSubclassOfClass: [DateViewController class]]) {
        DateViewController *Controller = (id)popoverPresentationController.presentedViewController;
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"dd MMM yyyy"];
        [self.endsRepeatLabel setText:[formatter stringFromDate:Controller.date.date]];
        self.schedule.endRepeat = Controller.date.date;
    }
}

-(void)DoneClick:(id)sender
{
    if (self.schedule.starts == nil) {
        [[[UIAlertView alloc] initWithTitle:@"Erro" message:@"Não foi selecionado a data de início da consulta." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil] show];
        return;
    }
    if (self.schedule.ends == nil) {
        [[[UIAlertView alloc] initWithTitle:@"Erro" message:@"Não foi selecionado a data de término da consulta." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil] show];
        return;
    }
    if (self.schedule.daysRepeat == nil) {
        [[[UIAlertView alloc] initWithTitle:@"Erro" message:@"Não foi selecionado os dias de repetição." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil] show];
        return;
    }
    if (self.schedule.endRepeat == nil) {
        [[[UIAlertView alloc] initWithTitle:@"Erro" message:@"Não foi selecionado a data para terminar a repetição." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil] show];
        return;
    }
    if (self.schedule.endRepeat.timeIntervalSince1970 < self.schedule.starts.timeIntervalSince1970) {
        [[[UIAlertView alloc] initWithTitle:@"Erro" message:@"A data do término de repetição tem que ser após o início da consulta." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil] show];
        return;
    }
    [self.navigationController popToRootViewControllerAnimated:YES];
    
    
    NSMutableArray *consultas1 = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 7 ; i++) {
        if ([self.schedule.daysRepeat[i] intValue] == 1)
        {
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setDateFormat:@"hh"];
            NSString *HoraInicio = [formatter stringFromDate:self.schedule.starts];
            [formatter setDateFormat:@"mm"];
            NSString *MinutoInicio = [formatter stringFromDate:self.schedule.starts];
            [formatter setDateFormat:@"hh"];
            NSString *HoraFinal = [formatter stringFromDate:self.schedule.ends];
            [formatter setDateFormat:@"mm"];
            NSString *MinutoFinal = [formatter stringFromDate:self.schedule.ends];
            
            PFObject *consulta = [[PFObject alloc] initWithClassName:@"TipoConsulta"];
            consulta[@"numeroDiaSemana"] = [NSNumber numberWithInt:i+1];
            consulta[@"HoraInicio"] = HoraInicio;
            consulta[@"HoraFinal"] = HoraFinal;
            consulta[@"MinInicio"] = MinutoInicio;
            consulta[@"MinFinal"] = MinutoFinal;
            consulta[@"ObjectID"] = [Medico sharedDoctor].parseObject.objectId;
            
            
            [consultas1 addObject:consulta];
        }
    }
    
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    [formatter setDateFormat:@"E  e  c  dd MMM yyyy   hh:mm a"];
//    NSDateFormatter *dayOfWeek = [[NSDateFormatter alloc] init];
//    [dayOfWeek setDateFormat:@"e"];
//    
//    NSMutableArray *consultas1 = [[NSMutableArray alloc] init];
    
//    PFRelation *relationTipoConsulta = [[Medico sharedDoctor].parseObject relationForKey:@"id_tipoConsulta"];
//    
//    PFObject __block *tipoConsulta = [[PFObject alloc] initWithClassName:@"TipoConsulta"];
//    
//    PFRelation *consultas = [tipoConsulta relationForKey:@"id_consulta"];


//    for (int i = 0; i<200; i++) {
//        NSDate *date = [NSDate dateWithTimeInterval: 24*3600*i sinceDate:self.schedule.starts];
//        int dayweek = [[dayOfWeek stringFromDate:date] intValue];
//        NSLog(@"%@",[formatter stringFromDate:date]);
//            if ([self.schedule.daysRepeat[dayweek-1] intValue] == 1)
//            {
//                PFObject *consulta = [[PFObject alloc] initWithClassName:@"Consulta"];
//                consulta[@"data"] = date;
////                consulta[@"end"] = date;
//                
//                [consultas addObject: consulta];
//                [consultas1 addObject: consulta];
//                
//                NSLog(@"esse");
//            }
//        
//    }
    
    [PFObject saveAllInBackground:consultas1 block:^(BOOL succeeded, NSError *error) {
        
    }];
    

    
    
}

@end
