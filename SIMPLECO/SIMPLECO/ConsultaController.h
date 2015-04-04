//
//  ConsultaController.h
//  SIMPLECO
//
//  Created by Liliane Bezerra Lima on 27/03/15.
//  Copyright (c) 2015 Liliane Bezerra Lima. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "Medico.h"
#import "ResultPesqTableViewController.h"
#import "Consulta.h"
#import "ConsultaViewController.h"
#import "RegiaoTableViewController.h"

@interface ConsultaController : NSObject

+ (ConsultaController*)sharedInstance;
-(void)creatingConsultaComData:(NSDate*)data eIdPaciente:(PFObject *)paciente ;//AndComplete: (void(^)(void)) callback;

#pragma mark - Buscar Consultas
-(void)buscarAgenda:(PFObject*)object andDiaSelec:(NSNumber*)diaSelecionado AndComplete:(void(^)(NSArray*)) callback;

@end
