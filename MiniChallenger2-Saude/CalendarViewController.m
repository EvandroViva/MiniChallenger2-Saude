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
    Consultation *consult,*con;
    BOOL boole;
    Patient *pacientee;
    
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
    pacientee = [[Patient alloc]init];
    con = [[Consultation alloc]init];
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
    //consultass = nil;
    [self.TableView reloadData];
    
    
    
    [self buscarConsultaAgendada:[self ConverteDia:date] andIDMedico:[Medico sharedDoctor].parseObject.objectId andComplete:^(NSMutableArray *array)
    {
        consultass = array;
        
    }];
    
    for (int t=0; t<consultass.count; t++)
    {
        con = consultass[t];
    [self BuscarPaciente:con.ID andComplete:^(Patient *pat)
     {
         pacientee = pat;
         [self.TableView reloadData];
         
     }];
    }
    
    
    
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
    [query whereKey:@"objectId" equalTo:ID];
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


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return consultass.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CalendarTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellCalendar" forIndexPath:indexPath];

    
    if (cell == nil)
    {
        cell = [[CalendarTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellCalendar"];
    }

    consult = consultass[indexPath.row];
    
//    [self BuscarPaciente:consult.ID andComplete:^(Patient *pat)
//     {
//         pacientee = pat;
//         [self.TableView reloadData];
//         
//     }];
    
    cell.LabelHora.text = [NSString stringWithFormat:@"%@:%@", consult.HoraInicio,consult.MinInicio];
    cell.LabelNome.text = pacientee.nome;
    
     return cell;

    }

   
    



@end
