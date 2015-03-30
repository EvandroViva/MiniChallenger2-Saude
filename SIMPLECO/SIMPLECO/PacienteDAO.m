//
//  PacienteDAO.m
//  SIMPLECO
//
//  Created by Liliane Bezerra Lima on 27/03/15.
//  Copyright (c) 2015 Liliane Bezerra Lima. All rights reserved.
//

#import "PacienteDAO.h"

@implementation PacienteDAO

// SINGLETON
//==========================================================
static PacienteDAO *SINGLETON = nil;
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
-(void)cadastrarPaciente:(Paciente*)pac
{
//    PFObject *paciente = [PFObject objectWithClassName:@"Paciente"];
//    paciente[@"nome"] = pac.nome;
//    paciente[@"telefone"] = pac.telefone;
//    paciente[@"email"] = pac.email;
//    paciente[@"senha"] = pac.senha;
//    // estrangeiras
//    paciente[@"id_consulta"] = pac.id_consulta;
//    [paciente saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//        if (succeeded) {
//            NSLog(@"Paciente Cadastrado!");
//        } else {
//            NSLog(@"Erro ao cadastrar Paciente");
//        }
//    }];
}

// read
-(void)selecionarPaciente:(NSString*)id_pac
{
    
}

// update
-(void)alterarPaciente:(Paciente*)pac
{
    
}

// delete
-(void)excluirPaciente:(NSString*)id_pac
{
    
}

@end
