//
//  ConsultaDAO.m
//  SIMPLECO
//
//  Created by Liliane Bezerra Lima on 27/03/15.
//  Copyright (c) 2015 Liliane Bezerra Lima. All rights reserved.
//

#import "ConsultaDAO.h"

@implementation ConsultaDAO

// SINGLETON
//==========================================================
static ConsultaDAO *SINGLETON = nil;
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
-(void)cadastrarConsulta:(Consulta*)cons
{
    
}

// read
-(void)selecionarConsulta:(NSString*)id_cons
{
    
}

// update
-(void)alterarConsulta:(Consulta*)cons
{
    
}

// delete
-(void)excluirConsulta:(NSString*)id_cons
{
    
}

@end
