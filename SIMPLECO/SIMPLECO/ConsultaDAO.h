//
//  ConsultaDAO.h
//  SIMPLECO
//
//  Created by Liliane Bezerra Lima on 27/03/15.
//  Copyright (c) 2015 Liliane Bezerra Lima. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Consulta.h"
#import <Parse/Parse.h>

@interface ConsultaDAO : NSObject

// SINGLETON
+ (ConsultaDAO*)sharedInstance;

// CRUD
// create
-(void)cadastrarConsulta:(Consulta*)cons;

// read
-(void)selecionarConsulta:(NSString*)id_cons;

// update
-(void)alterarConsulta:(Consulta*)cons;

// delete
-(void)excluirConsulta:(NSString*)id_cons;

@end
