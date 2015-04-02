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
    int i,x,teste,DiaSemana,DiaSemanaSelecionado;
    NSCalendar *gregorian;
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
    gregorian = [NSCalendar currentCalendar];
    
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
  
  //  _consultas = [[NSArray alloc]init];
    _segunda = [[NSMutableArray alloc]init];
    _terca = [[NSMutableArray alloc]init];
    _quarta = [[NSMutableArray alloc]init];
    _quinta = [[NSMutableArray alloc]init];
    _sexta = [[NSMutableArray alloc]init];
    _mostrar = [[NSArray alloc]init];
    _semana = [[NSMutableArray alloc]initWithObjects:_domingo, _sabado, _segunda,_terca,_quarta,_quinta,_sexta, nil];
    
    
    
    x=0;

    
    
    
    
    //================
    
    NSDate *today = [NSDate date];
    today = [self diasemana:today];
    NSLog(@"hj?%@",today);
 
   
}



-(NSDate*)diasemana:(NSDate*)today
{
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* comp = [calendar components:NSYearForWeekOfYearCalendarUnit |NSYearCalendarUnit|NSMonthCalendarUnit|NSWeekCalendarUnit|NSWeekdayCalendarUnit fromDate:[NSDate date]];
    [comp setWeekday:1 ];
    return [[NSCalendar currentCalendar] dateByAddingComponents:comp toDate:today options:0];
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
    teste=0;
    
    
    
    
    
    //NSLog(@"Data no banco = %@",_consulta.diaSemana);
//    //if ([_consulta.diaSemana isEqualToString: formatoData]) {
//        NSLog(@"Sao iguais");
//    }
    
}


#pragma mark - Botoes

- (IBAction)didGoTodayTouch
{
    [self.calendar setCurrentDate:[NSDate date]];
    
    NSCalendar *cal = [NSCalendar currentCalendar];
    NSDateComponents *components = [cal components:( NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit ) fromDate:[[NSDate alloc] init]];
    
    [components setHour:-[components hour]];
    [components setMinute:-[components minute]];
    [components setSecond:-[components second]];
    NSDate *today = [cal dateByAddingComponents:components toDate:[[NSDate alloc] init] options:0]; //This variable should now be pointing at a date object that is the start of today (midnight);
    
    [components setHour:-24];
    [components setMinute:0];
    [components setSecond:0];
    NSDate *yesterday = [cal dateByAddingComponents:components toDate: today options:0];
    
    components = [cal components:NSWeekdayCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:[[NSDate alloc] init]];
    
    [components setDay:([components day] - ([components weekday] - 1))];
    NSDate *thisWeek  = [cal dateFromComponents:components];
    
    [components setDay:([components day] - 7)];
    NSDate *lastWeek  = [cal dateFromComponents:components];
    
    [components setDay:([components day] - ([components day] -1))];
    NSDate *thisMonth = [cal dateFromComponents:components];
    
    [components setMonth:([components month] - 1)];
    NSDate *lastMonth = [cal dateFromComponents:components];
    
    NSLog(@"today=%@",today);
    NSLog(@"yesterday=%@",yesterday);
    NSLog(@"thisWeek=%@",thisWeek);
    NSLog(@"lastWeek=%@",lastWeek);
    NSLog(@"thisMonth=%@",thisMonth);
    NSLog(@"lastMonth=%@",lastMonth);
}

- (IBAction)didChangeModeTouch
{
    self.calendar.calendarAppearance.isWeekMode = !self.calendar.calendarAppearance.isWeekMode;
    
    [self transitionExample];
}

#pragma mark - JTCalendarDataSource

- (BOOL)calendarHaveEvent:(JTCalendar *)calendar date:(NSDate *)date
{
    
//    int a;
//    a =0;
//    DiaSemana = (int)[self NumeroDiaSemana:date];
//    NSString *formatoData = [self ConverteDia:date];
//    NSString *formatoDataMont = [self ConverteDiaSemana:date];
//
//    NSLog(@"Que mostra ?%@",formatoDataMont);
//    NSLog(@"Que dia e hj? %@",formatoData);
//  
//    
//    switch (DiaSemana) {
//        case 1:
//            if (_domingo.count != 0)
//            a = 1;
//            break;
//        case 2:
//            if (_segunda.count != 0)
//            a=1;
//            break;
//        case 3:
//            if (_terca.count != 0)
//            a=1;
//            break;
//        case 4:
//            if (_quarta.count != 0)
//            a=1;
//            break;
//        case 5:
//            if (_quinta.count != 0)
//            a=1;
//            break;
//        case 6:
//            if (_sexta.count != 0)
//            a=1;
//            break;
//        case 7:
//            if (_sabado.count != 0)
//            a=1;
//            break;
//            
//        default:
//            a=0;
//            break;
//    }
//
//    
//    return a;
    
    return 0;
}


#pragma mark - Converte NSDate em diaSemana e Dia
-(NSString*)ConverteDiaSemana:(NSDate*)date
{
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    [format setDateFormat:@"EEEE"];
    NSString *formatoData = [format stringFromDate:date];
    //NSLog(@"Data Atual = %@",formatoData);
    
    return formatoData;
}

-(NSString*)ConverteDia:(NSDate*)date
{
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    [format setDateFormat:@" dd /MM/yyyy"];
    NSString *formatoData = [format stringFromDate:date];
    
    return formatoData;
    
}

#pragma mark - Numero correspondente ao dia da semana
-(NSUInteger)NumeroDiaSemana: (NSDate*)date
{
    NSUInteger valor = [gregorian ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitWeekOfMonth forDate:date];
    NSLog(@"Adjusted weekday ordinal: %lu", (unsigned long)valor);
    return valor;
    
}

#pragma mark - Selecionar um dia
- (void)calendarDidDateSelected:(JTCalendar *)calendar date:(NSDate *)date
{
     DiaSemanaSelecionado = (int)[self NumeroDiaSemana:date];
    [[ConsultaController sharedInstance]buscarAgenda:singleton.medicoSelecionado.parseObject andDiaSelec:[NSNumber numberWithInt:DiaSemanaSelecionado] AndComplete:^(NSArray *array)
     {
         _mostrar = array;
         [self.tableView reloadData];
     }];
//   
//    switch (DiaSemanaSelecionado) {
//        case 1:
//            _mostrar = _domingo;
//            break;
//        case 2:
//            _mostrar = _segunda;
//            break;
//        case 3:
//            _mostrar = _terca;
//            break;
//        case 4:
//            _mostrar = _quarta;
//            break;
//        case 5:
//            _mostrar = _quinta;
//            break;
//        case 6:
//            _mostrar = _sexta;
//            break;
//        case 7:
//            _mostrar = _sabado;
//            break;
//            
//        default:
//            _mostrar = nil;
//            break;
//    }
    
    dataSelecionada = date;
    teste =1;
    
    
    
    
  
   NSLog(@"Date: %@", date);
     NSLog(@"Date: %@", dataSelecionada);
    NSLog(@"Mostart %@",_mostrar);
}

#pragma mark - Salvar Horário
-(NSDate*)dateByAddingHours:(NSInteger)hours andMinute:(NSInteger)minute andData:(NSDate*)date
{
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setHour:hours];
    [components setMinute:minute];
  
    
    return [[NSCalendar currentCalendar] dateByAddingComponents:components toDate:date options:0];
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
    return _mostrar.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    ConsultaTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CelulaMConsulta" forIndexPath:indexPath];
    
    if (cell == nil)
    {
        cell = [[ConsultaTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CelulaMConsulta"];
    }
    if (_mostrar.count == 0)
        _consulta.horarioInicial = 0;
    
    else
    {
    _consulta = _mostrar[indexPath.row];
   // NSNumber* n = _consulta.horarioInicial;
    NSLog(@"singleton =%ld", (long)index);
    NSString *ok = [_consulta.horarioInicial stringValue];
    cell.LData.text = ok;
    cell.LConteudo.text = @"Consulta";
    }
    
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _consulta = _mostrar[indexPath.row];
    int num = [_consulta.horarioInicial intValue];
    dataSelecionada = [self dateByAddingHours:num andMinute:0 andData:dataSelecionada];
    
    [self performSegueWithIdentifier:@"showLogin" sender:self] ;

}


@end
