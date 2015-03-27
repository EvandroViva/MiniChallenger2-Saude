//
//  MedicoDAO.m
//  SIMPLECO
//
//  Created by Liliane Bezerra Lima on 27/03/15.
//  Copyright (c) 2015 Liliane Bezerra Lima. All rights reserved.
//

#import "MedicoDAO.h"

@implementation MedicoDAO

// SINGLETON
//==========================================================
static MedicoDAO *SINGLETON = nil;
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
-(void)cadastrarMedico:(Medico*)med
{
    
}

// read
-(void)selecionarMedico:(NSString*)id_med
{
    
}

// update
-(void)alterarMedico:(Medico*)med
{
    
}

// delete
-(void)excluirMedico:(NSString*)id_med
{
    
}

@end
