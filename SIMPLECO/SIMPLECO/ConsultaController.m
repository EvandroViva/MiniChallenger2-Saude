//
//  ConsultaController.m
//  SIMPLECO
//
//  Created by Liliane Bezerra Lima on 27/03/15.
//  Copyright (c) 2015 Liliane Bezerra Lima. All rights reserved.
//

#import "ConsultaController.h"


@interface ConsultaController ()
{
    ResultPesqTableViewController* med;
}
@end

@implementation ConsultaController
static ConsultaController *SINGLETON = nil;
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

-(void)creatingConsultaComData:(NSDate*)data eIdPaciente:(PFObject*)paciente /*AndComplete: (void(^)(void)) callback;*/{
    NSLog(@"A DE AZARADO");
    med=[ResultPesqTableViewController sharedInstance];
    PFObject* persona=[PFObject objectWithClassName:@"Consulta"];
    
    //persona[@"data"]=data;
    persona[@"id_tipoConsulta"]=med.medicoSelecionado.id_tipoConsulta;
    persona[@"id_medico"]=med.medicoSelecionado.objectID;
    persona[@"id_paciente"]=paciente.objectId;
    persona[@"endereco"]=med.medicoSelecionado.endereco;
    [persona saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"passou");
            [[NSNotificationCenter defaultCenter] postNotificationName:@"InformacoesEnviadas" object:nil];
        } else {
            NSLog(@"!passou");
            // There was a problem, check error.description
        }
    }];
}


// SINGLETON
//==========================================================
static ConsultaController *SINGLETON = nil;
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


-(void)buscarAgenda:(PFObject*)object AndComplete:(void(^)(void)) callback
{
    PFRelation* relation = [object relationForKey:@"id_tipoConsulta"];
    [[relation query]findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        NSLog(@"asdasdasdsa");
        if (!error) {
            // The find succeeded.
            
            NSLog(@"Successfully retrieved %lu MEDICOS.", (unsigned long)objects.count);
            // Do something with the found objects
            for (PFObject *object in objects)
            {
                Consulta *consulta = [[Consulta alloc]init];
                consulta.diaSemana = object[@"diaSemana"];
                consulta.data = object[@"diaSemana"];
                NSLog(@"DIA ? =%@",consulta.diaSemana);
                
            }
            
        }
        
        else {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
        callback();
    }];
}

@end
