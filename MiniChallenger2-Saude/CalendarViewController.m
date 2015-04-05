//
//  CalendarViewController.m
//  MiniChallenger2-Saude
//
//  Created by Evandro Remon Pulz Viva on 31/03/15.
//  Copyright (c) 2015 Evandro Remon Pulz Viva. All rights reserved.
//

#import "CalendarViewController.h"
#import "JTCalendar/JTCalendar.h"
#import "JTCalendar.h"

@interface CalendarViewController ()
{
    Consultation *consult;
    
}

@end

@implementation CalendarViewController
@synthesize consultass;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.calendar = [JTCalendar new];

    
        self.calendar.calendarAppearance.calendar.firstWeekday = 2;
        self.calendar.calendarAppearance.dayCircleRatio = 9. / 10.;
        self.calendar.calendarAppearance.ratioContentMenu = 1.;

    [self.calendar setMenuMonthsView:self.calendarMenuView];
    [self.calendar setContentView:self.calendarContentView];
    [self.calendar setDataSource:self];
    [self.calendar reloadData];
    consultass = [[NSMutableArray alloc]init];
    consult = [[Consultation alloc]init];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.view addSubview:self.calendarContentView];
    [self.view addSubview:self.calendarMenuView];
    [self.view reloadInputViews];
    [self.calendar reloadData];
    [self.view setNeedsDisplay];
}

#pragma mark - JTCalendarDataSource

- (BOOL)calendarHaveEvent:(JTCalendar *)calendar date:(NSDate *)date
{
    return 0;
}

- (void)calendarDidDateSelected:(JTCalendar *)calendar date:(NSDate *)date
{
    NSLog(@"Date: %@", date);
   // [self.TableView reloadData];
    
    
//    [self buscarConsultaAgendada:[self ConverteDia:date] andIDMedico:[Medico sharedDoctor].parseObject.objectId andComplete:^(NSMutableArray *array)
//    {
//        consultass = array;
//    }];
    
}


-(void)buscarConsultaAgendada:(NSString*)data andIDMedico:(NSString*)IDMedico andComplete:(void(^)(NSMutableArray*)) callback
{
    PFQuery *query = [PFQuery queryWithClassName:@"Excecao"];
    [query whereKey:@"objectIDM" equalTo:IDMedico];
    [query whereKey:@"Date" equalTo:data];
    [query orderByAscending:@"HoraInicio"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        NSMutableArray *consultas = [[NSMutableArray alloc]init];
        if (!error) {
            NSLog(@"Successfully retrieved %lu MEDICOS.", (unsigned long)objects.count);
            for (PFObject *object in objects)
            {
                Consultation *consulta = [[Consultation alloc]init];
                consulta.HoraInicio = object[@"HoraInicio"];
                consulta.MinInicio = object[@"MinInicial"];
                consulta.Data = object[@"Data"];
                consulta.ID = object[@"objectIDP"];
                [consultas addObject:consulta];
            }
        }
        else {
            NSLog(@"Error: %@ %@", error, [error userInfo]);

        }
        callback(consultas);
    }];

    
}

-(void)BuscarPaciente:(NSString*)ID andComplete:(void(^)(Patient *)) callback
{
    PFQuery *query = [PFQuery queryWithClassName:@"Paciente"];
    [query whereKey:@"objectID" equalTo:ID];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        Patient *paciente = [[Patient alloc]init];
        if (!error) {
            NSLog(@"Successfully retrieved %lu MEDICOS.", (unsigned long)objects.count);
            for (PFObject *object in objects)
            {
                paciente.nome = object[@"nome"];
                paciente.telefone = object[@"telefone"];
            }
        }
        else {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
            
        }
        callback(paciente);
    }];
    
   

}

-(NSString*)ConverteDia:(NSDate*)date
{
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    [format setDateFormat:@" dd/MM/yyyy"];
    NSString *formatoData = [format stringFromDate:date];
    return formatoData;
}


#pragma mark - Transition examples

- (void)transitionExample
{
    CGFloat newHeight = 200;
    if(self.calendar.calendarAppearance.isWeekMode){
        newHeight = 75.;
    }
    
    [UIView animateWithDuration:.5
                     animations:^{
                         self.calendarContentViewHeight.constant = newHeight;
                         [self.view layoutIfNeeded];
                     }];
    
    [UIView animateWithDuration:.25
                     animations:^{
                         self.calendarContentView.layer.opacity = 0;
                     }
                     completion:^(BOOL finished) {
                         [self.calendar reloadAppearance];
                         
                         [UIView animateWithDuration:.25
                                          animations:^{
                                              self.calendarContentView.layer.opacity = 1;
                                          }];
                     }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)Hoje:(id)sender {
    [self.calendar setCurrentDate:[NSDate date]];
}

- (IBAction)Visualizacao:(id)sender {
    self.calendar.calendarAppearance.isWeekMode = !self.calendar.calendarAppearance.isWeekMode;
    
    [self transitionExample];
}

//
//#pragma mark - Table
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 1;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return consultass.count;
//}
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//    CalendarTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
//
//    
//    if (cell == nil)
//    {
//        cell = [[CalendarTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
//    }
//    
////    consult = consultass[indexPath.row];
////    [self BuscarPaciente:consult.ID andComplete:^(Patient *paciente){
////        NSLog(@"Paciente =%@",paciente);
////    }];
////    
//    cell.LabelNome.text = @"Teste";
//     return cell;
//
//    
//    
////    else
////        
////    {
////        
////        _consulta = _mostrar[indexPath.row];
////        
////        // NSNumber* n = _consulta.horarioInicial;
////        
////        NSLog(@"singleton =%ld", (long)index);
////        
////        // NSString *ok = [self ConverteHora:dataSelecionada];
////        
////        NSString *ok = _consulta.HoraInicio;
////        
////        NSString *ok1 = @":";
////        
////        NSString *ok2 = _consulta.MinInicio;
////        
////        ok = [ok stringByAppendingString:ok1];
////        
////        ok = [ok stringByAppendingString:ok2];
////        
////        
////        
////        NSString *e = _consulta.HoraFinal;
////        
////        NSString *e1 = @":";
////        
////        NSString *e2= _consulta.MinFinal;
////        
////        e = [e stringByAppendingString:e1];
////        
////        e = [e stringByAppendingString:e2];
////        
////        
////        
////        cell.LData.text = ok;
////        cell.LDataFinal.text = e;
////        
////        // cell.LFim.text = e;
////        
////        cell.LConteudo.text = @"Consulta";
////        
////    }
//    
//   
//    



@end
