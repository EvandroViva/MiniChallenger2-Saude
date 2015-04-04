//
//  EspecialidadesTableViewController.h
//  SIMPLECO
//
//  Created by Liliane Bezerra Lima on 24/03/15.
//  Copyright (c) 2015 Liliane Bezerra Lima. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EspecialidadesTableViewCell.h"
#import "ViewController.h"
#import "MedicoController.h"
#import "RegiaoTableViewController.h"

@interface EspecialidadesTableViewController : UITableViewController

// SINGLETON
+ (EspecialidadesTableViewController*)sharedInstance;

// ATRIBUTOS
@property NSArray *listaEspecialidade;
@property NSString *especialidade;
@property NSArray *especialidades;
@property NSMutableArray *exibir;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *Carregando;

@end
