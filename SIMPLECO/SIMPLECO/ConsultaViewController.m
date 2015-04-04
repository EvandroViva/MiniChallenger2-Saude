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
@synthesize hora;
@synthesize minuto;
@synthesize DiaSemanaSelecionado;
@synthesize horario;
@synthesize DiaSelecionado;

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
    _mostrar = [[NSMutableArray alloc]init];
    _excecoes = [[NSMutableArray alloc]init];
    _vagas = [[NSMutableArray alloc]init];
    verficabusca = FALSE;
    verifexcecao = FALSE;
    
    
    x=0;
   
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
//    UIView *novaview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
//    [novaview setBackgroundColor:[UIColor blackColor]];
//    [novaview setAlpha:0.4];
//    [self.view addSubview:novaview];
    bit = 0;
    
    [_vagas removeAllObjects];
    [_mostrar removeAllObjects];
  // [self.tableView reloadData];
    
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
    
    [[ConsultaController sharedInstance]buscarExcecao:singleton.medicoSelecionado.parseObject andIndex:DiaSelecionado andDiaSelec:dataSelecionada andComplete:^(NSMutableArray *array)
     {
         [self.tableView reloadData];
         NSLog(@"excessao = %@",array);
         _excecoes = array;
        // [novaview removeFromSuperview];
         // [self TirandoExcecao];
         
         verifexcecao = TRUE;
         if (verficabusca == TRUE && verifexcecao == TRUE)
         {
             [self TirandoExcecao];
             bit =1;
         }
         
         
     }];
    
    [[ConsultaController sharedInstance]buscarAgenda:singleton.medicoSelecionado.parseObject andDiaSelec:[NSNumber numberWithInt:DiaSemanaSelecionado] AndComplete:^(NSMutableArray *array)
     {
         _mostrar = array;
         //[self TirandoExcecao];
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
    for (int e=0; e<_excecoes.count; e++) {
        for (int f=0; f<_mostrar.count; f++) {
        _consulta2 = _mostrar[e];
        _excecao = _excecoes[e];
        
        if (_consulta2.horarioInicial != _excecao.horarioInicial)
        {
            if (_consulta2.horarioInicial < _excecao.horarioInicial)
            {
                
                [_vagas addObject:_consulta2];
                [_mostrar removeObject:_consulta2];
            }
        }
        else
             [_mostrar removeObject:_consulta2];
            
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
        return _mostrar.count;

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
    NSString *ok = [_consulta.horarioInicial stringValue];
    cell.LData.text = ok;
    cell.LConteudo.text = @"Consulta";
    }
    
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _consulta = _mostrar[indexPath.row];
    horario = _consulta.horarioInicial;
    int num = [_consulta.horarioInicial intValue];
    dataSelecionada = [self dateByAddingHours:num andMinute:0 andData:dataSelecionada];
    
    [self performSegueWithIdentifier:@"showLogin" sender:self] ;

}


@end
