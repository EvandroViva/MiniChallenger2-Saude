//
//  ConsultaViewController.h
//  SIMPLECO
//
//  Created by Liliane Bezerra Lima on 24/03/15.
//  Copyright (c) 2015 Liliane Bezerra Lima. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JTCalendar.h"
#import "LoginViewController.h"
#import "ConsultaTableViewCell.h"
#import "ResultPesqTableViewController.h"
#import "ConsultaController.h"
#import "Consulta.h"


@interface ConsultaViewController : UIViewController <JTCalendarDataSource,UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet JTCalendarMenuView *calendarMenuView;
@property (weak, nonatomic) IBOutlet JTCalendarContentView *calendarContentView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *calendarContentViewHeight;

@property (strong, nonatomic) JTCalendar *calendar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property NSInteger index;
@property NSDate *dataSelecionada;

+ (ConsultaViewController*)sharedInstance;
@property NSInteger *hora;
@property NSInteger *minuto;
@property NSArray* consultas;
@property NSString* diaSemanaSelecionada;
@property NSString* diaSemanaAgenda;
@property Consulta* consulta;
@property NSMutableArray* segunda, *terca, *quarta, *quinta, *sexta;


@end
