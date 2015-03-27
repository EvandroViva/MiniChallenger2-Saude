//
//  TipoConsultaDAO.m
//  SIMPLECO
//
//  Created by Liliane Bezerra Lima on 27/03/15.
//  Copyright (c) 2015 Liliane Bezerra Lima. All rights reserved.
//

#import "TipoConsultaDAO.h"

@implementation TipoConsultaDAO

// SINGLETON
//==========================================================
static TipoConsultaDAO *SINGLETON = nil;
static bool isFirstAccess = YES;

+ (id)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isFirstAccess = NO;
        SINGLETON = [[super allocWithZone:NULL] init];
    });
    
    return SINGLETON;
}
//==========================================================


// CRUD
// create
-(void)cadastrarTipoConsulta:(TipoConsulta*)tc
{
    
}

// read
-(void)selecionarTipoConsulta:(NSString*)id_tc
{
    
}

// update
-(void)alterarTipoConsulta:(TipoConsulta*)tc
{
    
}

// delete
-(void)excluirTipoConsulta:(NSString*)id_tc
{
    
}

@end
