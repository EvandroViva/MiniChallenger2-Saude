//
//  TipoConsultaDAO.h
//  SIMPLECO
//
//  Created by Liliane Bezerra Lima on 27/03/15.
//  Copyright (c) 2015 Liliane Bezerra Lima. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TipoConsulta.h"

@interface TipoConsultaDAO : NSObject

// SINGLETON
+ (TipoConsultaDAO*)sharedInstance;

// CRUD
// create
-(void)cadastrarTipoConsulta:(TipoConsulta*)tc;

// read
-(void)selecionarTipoConsulta:(NSString*)id_tc;

// update
-(void)alterarTipoConsulta:(TipoConsulta*)tc;

// delete
-(void)excluirTipoConsulta:(NSString*)id_tc;

@end
