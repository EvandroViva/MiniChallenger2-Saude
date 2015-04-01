//
//  ConsultaViewController.m
//  SIMPLECO
//
//  Created by Liliane Bezerra Lima on 24/03/15.
//  Copyright (c) 2015 Liliane Bezerra Lima. All rights reserved.
//

#import "ConsultaViewController.h"

@interface ConsultaViewController ()
{
    ResultPesqTableViewController *singleton;
}

@end
@implementation ConsultaViewController
@synthesize index;
@synthesize dataSelecionada;
@synthesize hora;
@synthesize minuto;

static ConsultaViewController *SINGLETON = nil;


+ (id)sharedInstance
{
    return SINGLETON;
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
//---------------------------------------------------------------------------------------------------
//                      INICIALIZANDO O CALENDÁRIO
//---------------------------------------------------------------------------------------------------
    self.calendar = [JTCalendar new];
    {
        self.calendar.calendarAppearance.calendar.firstWeekday = 2;
        self.calendar.calendarAppearance.dayCircleRatio = 9. / 10.;
        self.calendar.calendarAppearance.ratioContentMenu = 1.;
    }
    
    [self.calendar setMenuMonthsView:self.calendarMenuView];
    [self.calendar setContentView:self.calendarContentView];
    [self.calendar setDataSource:self];
    [self.calendar reloadData];
    [self BackButtonNavigationController];
    
    
//---------------------------------------------------------------------------------------------------
//                      SINGLETON
//---------------------------------------------------------------------------------------------------
    singleton = [ResultPesqTableViewController sharedInstance];
    //index = singleton.index;
    SINGLETON = self;
    hora = (NSInteger*) 9;
    minuto = (NSInteger*) 00;
    
//---------------------------------------------------------------------------------------------------
//                      PARSE
//---------------------------------------------------------------------------------------------------
  
    
    [[MedicoController sharedInstance]buscarAgenda: singleton.medicoSelecionado.parseObject AndComplete:^()
    {
        
    }];
    
   
}

#pragma mark Botao de Navegation de voltar

- (void)BackButtonNavigationController {
    
    UIBarButtonItem *btnBack = [[UIBarButtonItem alloc]
                                initWithBarButtonSystemItem:
                                UIBarButtonSystemItemRewind
                                target:self
                                action:@selector(voltar:)];
    self.navigationItem.leftBarButtonItem = btnBack;
    
}

-(void)voltar:(id)sender  {
    [self.navigationController popViewControllerAnimated:NO];
}


#pragma mark - Inicializar a view

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.view addSubview:self.calendarContentView];
    [self.view addSubview:self.calendarMenuView];
    [self.view reloadInputViews];
    [self.calendar reloadData];
    [self.view setNeedsDisplay];
}


#pragma mark - Botoes

- (IBAction)didGoTodayTouch
{
    [self.calendar setCurrentDate:[NSDate date]];
}

- (IBAction)didChangeModeTouch
{
    self.calendar.calendarAppearance.isWeekMode = !self.calendar.calendarAppearance.isWeekMode;
    
    [self transitionExample];
}

#pragma mark - JTCalendarDataSource

- (BOOL)calendarHaveEvent:(JTCalendar *)calendar date:(NSDate *)date
{
    return (rand() % 10) == 1;
}

#pragma mark - Selecionar um dia
- (void)calendarDidDateSelected:(JTCalendar *)calendar date:(NSDate *)date
{
    dataSelecionada = date;
    dataSelecionada = [self dateByAddingHours:9 andMinute:0];
   
    NSLog(@"Date: %@", date);
}

#pragma mark - Salvar Horário
-(NSDate*)dateByAddingHours:(NSInteger)hours andMinute:(NSInteger)minute
{
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setHour:hours];
    [components setMinute:minute];
    
    return [[NSCalendar currentCalendar] dateByAddingComponents:components toDate:dataSelecionada options:0];
}

#pragma mark - Transition examples

- (void)transitionExample
{
    CGFloat newHeight = 300;
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

#pragma mark - Tabela

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ConsultaTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CelulaMConsulta" forIndexPath:indexPath];
    
    if (cell == nil)
    {
        cell = [[ConsultaTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CelulaMConsulta"];
    }

    NSLog(@"singleton =%ld", (long)index);
    cell.LData.text = @"09:00";
    cell.LConteudo.text = @"Consulta";
    
    
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [self performSegueWithIdentifier:@"showLogin" sender:self] ;

}


@end
