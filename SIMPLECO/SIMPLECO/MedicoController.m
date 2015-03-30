//
//  MedicoController.m
//  SIMPLECO
//
//  Created by Liliane Bezerra Lima on 27/03/15.
//  Copyright (c) 2015 Liliane Bezerra Lima. All rights reserved.
//

#import "MedicoController.h"

@implementation MedicoController

// SINGLETON
//==========================================================
static MedicoController *SINGLETON = nil;
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


#pragma mark - Buscar Medicos
//========================================================
-(NSMutableArray*)buscarMedicos:(NSString*)especialidade andRegiao:(NSString*)regiao
{
    NSMutableArray* medicos = [[NSMutableArray alloc]init];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Medico"];
    [query whereKey:@"especialidade" equalTo:especialidade];
    [query whereKey:@"regiao" equalTo:regiao];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %lu MEDICOS.", (unsigned long)objects.count);
            // Do something with the found objects
            for (PFObject *object in objects) {
                Medico* medico = [[Medico alloc]init];
                medico.objectID = object[@"objectId"];
                medico.codTrabalho = object[@"codTrabalho"];
                medico.especialidade = object[@"especialidade"];
                medico.endereco = object[@"endereco"];
                medico.numero = object[@"numero"];
                medico.CEP = object[@"CEP"];
                medico.bairro = object[@"bairro"];
                medico.regiao = object[@"regiao"];
                // estrangeira
                medico.id_tipoConsulta = object[@"id_tipoConsulta"];
                
                NSLog(@"NOME PARSE: %@", object[@"nome"]);
                NSLog(@"NOME OBJETO: %@", medico.nome);
                NSLog(@"ESPECIALIDADE PARSE: %@", object[@"especialidade"]);
                NSLog(@"ESPECIALIDADE OBJETO: %@", medico.especialidade);
                NSLog(@"BAIRRO PARSE: %@", object[@"bairro"]);
                NSLog(@"BAIRRO OBJETO: %@", medico.bairro);
                [medicos addObject:medico];
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    NSLog(@"MEDICOS : %lu", (unsigned long)medicos.count);
    return medicos;
    
}

//========================================================

@end
