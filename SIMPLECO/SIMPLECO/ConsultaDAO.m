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
    PFObject *consulta = [PFObject objectWithClassName:@"Consulta"];
    consulta[@"data"] = cons.data;
    // estrangeiras
    consulta[@"id_tipoConsulta"] = cons.id_tipoConsulta;
    consulta[@"id_medico"] = cons.id_medico;
    consulta[@"id_paciente"] = cons.id_paciente;
    consulta[@"id_endereco"] = cons.id_endereco;
    [consulta saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"Consulta Cadastrado!");
        } else {
            NSLog(@"Erro ao cadastrar Consulta");
        }
    }];
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
