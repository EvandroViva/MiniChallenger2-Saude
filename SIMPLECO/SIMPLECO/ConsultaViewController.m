
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
    
    int i,x,teste,DiaSemana,bit;
    
    NSCalendar *gregorian;
    
    BOOL verifexcecao, verficabusca;
    
}



@end

@implementation ConsultaViewController

@synthesize index;
@synthesize dataSelecionada;
@synthesize DiaSemanaSelecionado;
@synthesize horario;
@synthesize DiaSelecionado;
@synthesize Hora, Minuto;


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
    
    
    
    //---------------------------------------------------------------------------------------------------
    
    //                      PARSE
    
    //---------------------------------------------------------------------------------------------------
    
    _mostrar = [[NSMutableArray alloc]init];
    
    _excecoes = [[NSMutableArray alloc]init];
    
    _vagas = [[NSMutableArray alloc]init];
    
    verficabusca = FALSE;
    
    verifexcecao = FALSE;
    
    
    
    
    
    x=0;
    
    
    CAGradientLayer *background = [CAGradientLayer layer];
    background.colors = @[(id)[UIColor colorWithRed:228/255.0 green:255/255.0 blue:255/255.0 alpha:1.0].CGColor, (id)[UIColor colorWithRed:148/255.0 green:238/255.0 blue:255/255.0 alpha:1.0].CGColor];
    background.locations = @[@0.2,@1.0];
    background.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    [self.view.layer insertSublayer:background atIndex:0];
    
    
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
    
    
    
    return 0;
    
}





#pragma mark - Converte NSDate em diaSemana e Dia

-(NSString*)ConverteDiaSemana:(NSDate*)date

{
    
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    
    [format setDateFormat:@"E"];
    
    NSString *formatoData = [format stringFromDate:date];
    
    //NSLog(@"Data Atual = %@",formatoData);
    
    
    
    return formatoData;
    
}



-(NSString*)ConverteDia:(NSDate*)date

{
    
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    
    [format setDateFormat:@" dd/MM/yyyy"];
    
    NSString *formatoData = [format stringFromDate:date];
    
    
    
    return formatoData;
    
    
    
}



-(NSString*)ConverteHora:(NSDate*)date

{
    
    
    
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    
    [format setDateFormat:@"HH:mm"];
    
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
    bit = 0;
    [_vagas removeAllObjects];
    [_mostrar removeAllObjects];
    [self.tableView reloadData];
    NSLog(@"Dia = %@",date);
    verifexcecao = FALSE;
    verficabusca = FALSE;
    DiaSemanaSelecionado = (int)[self NumeroDiaSemana:date];
    DiaSelecionado = [NSNumber numberWithInt:DiaSemanaSelecionado];
    dataSelecionada = date;
    [self Buscas];
}



-(void)Buscas

{
    
    [[ConsultaController sharedInstance]buscarExcecao:[self ConverteDia:dataSelecionada] andID:singleton.medicoSelecionado.objectID andComplete:^(NSMutableArray *array)
     
     {
         [self.tableView reloadData];
         NSLog(@"excessao = %@",array);
         _excecoes = array;
         verifexcecao = TRUE;
         if (verficabusca == TRUE && verifexcecao == TRUE)
         {
             [self TirandoExcecao];
             bit =1;
         }

     }];

    [[ConsultaController sharedInstance]buscarAgenda:[NSNumber numberWithInt:DiaSemanaSelecionado]  andObjectID:singleton.medicoSelecionado.objectID AndComplete:^(NSMutableArray *array)
     {
         _mostrar = array;
         verficabusca = TRUE;
         if (verficabusca == TRUE && verifexcecao == TRUE)
         {
             [self TirandoExcecao];
             bit =1;
             [self.tableView reloadData];
         }
     }];
}

-(void)Juntando
{
    [_vagas addObjectsFromArray:_mostrar];
}


-(void)TirandoExcecao
{
    int g =0;
    while (g != _excecoes.count)
    {
        _consulta2 = _mostrar[0];
        _excecao = _excecoes[g];
        if ([_consulta2.HoraInicio isEqualToString:_excecao.HoraInicio])
        {
            if ([_consulta2.MinInicio isEqualToString:_excecao.MinInicio])
            {
                [_mostrar removeObject:_consulta2];
                if (_mostrar.count ==0) {
                    g = (int)_excecoes.count;
                }
            }
            else
            {
                [_vagas addObject:_consulta2];
                [_mostrar removeObject:_consulta2];
            }
        }
        else
        {
            int cons2 = [_consulta2.HoraInicio intValue];
            int exc = [_excecao.HoraInicio intValue];
            if (cons2< exc) {
                [_vagas addObject:_consulta2];
                [_mostrar removeObject:_consulta2];
            }
            else
                g++;
        }
        
    }
    if (_excecoes.count !=0)
        
        [self Juntando];
    
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
    if (bit == 1) {
        if (_excecoes.count == 0)
            return _mostrar.count ;
        else
        {
            _mostrar = _vagas;
            return _mostrar.count;
        }
    }
    else
        if (_mostrar.count != 0)
            [self Buscas];
    return 0;
    
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
        
        // NSString *ok = [self ConverteHora:dataSelecionada];
        
        NSString *ok = _consulta.HoraInicio;
        
        NSString *ok1 = @":";
        
        NSString *ok2 = _consulta.MinInicio;
        
        ok = [ok stringByAppendingString:ok1];
        
        ok = [ok stringByAppendingString:ok2];
        
        
        
        NSString *e = _consulta.HoraFinal;
        
        NSString *e1 = @":";
        
        NSString *e2= _consulta.MinFinal;
        
        e = [e stringByAppendingString:e1];
        
        e = [e stringByAppendingString:e2];
        
        
        
        cell.LData.text = ok;
        cell.LDataFinal.text = e;
        
       // cell.LFim.text = e;
        
        cell.LConteudo.text = @"Consulta";
        
    }
    
    return cell;
    
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    _consulta = _mostrar[indexPath.row];
    
    Hora = _consulta.HoraInicio;
    Minuto = _consulta.MinInicio;
    int hora = [_consulta.HoraInicio intValue];
    
    int min = [_consulta.MinInicio intValue];
    
    
    
    // NSInteger b = [formatoHora integerValue];
    
    dataSelecionada = [self dateByAddingHours:hora andMinute:min andData:dataSelecionada];
    
    
    
    [self performSegueWithIdentifier:@"showLogin" sender:self] ;
    
    
    
}





@end

