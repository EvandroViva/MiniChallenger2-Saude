//
//  ViewController.h
//  SIMPLECO
//
//  Created by Liliane Bezerra Lima on 24/03/15.
//  Copyright (c) 2015 Liliane Bezerra Lima. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegiaoTableViewController.h"
#import "EspecialidadesTableViewController.h"
#import <EventKit/EventKit.h>
#import "MedicoController.h"
#import "ResultPesqTableViewController.h"

@interface ViewController : UIViewController

// SINGLETON
+ (ViewController*)sharedInstance;

// OUTLETS - STORYBOARD
@property (weak, nonatomic) IBOutlet UIButton *BBuscar;
@property (weak, nonatomic) IBOutlet UIButton *Bregiao;
@property (weak, nonatomic) IBOutlet UIButton *Bespecialidade;
@property (weak, nonatomic) IBOutlet UILabel *LEspecialidade;
@property (weak, nonatomic) IBOutlet UILabel *LRegiao;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *Carregando;

// ATRIBUTOS
@property NSString* regiao;
@property NSString* especialidade;
@property BOOL permissaoEvento;
@property EKEventStore *eventStore;

// METODOS
- (IBAction)BotaoBuscar:(id)sender;



@end

