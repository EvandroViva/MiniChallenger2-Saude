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
    PFObject *medico = [PFObject objectWithClassName:@"Medico"];
    medico[@"nome"] = med.nome;
    medico[@"email"] = med.email;
    medico[@"senha"] = med.senha;
    medico[@"codTrabalho"] = med.codTrabalho;
    medico[@"especialidade"] = med.especialidade;
    // estrangeiras
    medico[@"id_tipoConsulta"] = med.id_tipoConsulta;
    medico[@"id_endereco"] = med.id_endereco;
    [medico saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"Medico Cadastrado!");
        } else {
            NSLog(@"Erro ao cadastrar Medico");
        }
    }];
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
