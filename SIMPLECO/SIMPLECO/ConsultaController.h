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

@interface ConsultaController : NSObject

+ (ConsultaController*)sharedInstance;

#pragma mark - Buscar Consultas
-(void)buscarAgenda:(PFObject*)object AndComplete:(void(^)(void)) callback;

@end
