//
//  ConsultaController.m
//  SIMPLECO
//
//  Created by Liliane Bezerra Lima on 27/03/15.
//  Copyright (c) 2015 Liliane Bezerra Lima. All rights reserved.
//

#import "ConsultaController.h"

@implementation ConsultaController

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


-(void)buscarAgenda:(PFObject*)object andDiaSelec:(NSNumber*)diaSelecionado AndComplete:(void(^)(NSArray*)) callback;
{
    PFRelation* relation = [object relationForKey:@"id_tipoConsulta"];
    PFQuery *query = [relation query];
    [query whereKey:@"numeroDiaSemana" equalTo:diaSelecionado];
    [query addAscendingOrder:@"horarioInicial"];
   
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
         NSMutableArray *dia = [[NSMutableArray alloc]init];
        if (!error) {
            
            // The find succeeded.
            
            NSLog(@"Successfully retrieved %lu MEDICOS.", (unsigned long)objects.count);
            // Do something with the found objects
            
            for (PFObject *object in objects)
            {
                Consulta *consulta = [[Consulta alloc]init];
                consulta.numeroDiaSemana = object[@"numeroDiaSemana"];
                consulta.diaSemana = object[@"diaSemana"];
                consulta.horarioInicial = object[@"horarioInicial"];
                consulta.horarioFinal = object[@"horarioFinal"];
                consulta.data = object[@"Date"];
                [dia addObject:consulta];
            }
            
        }
        
        else {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
        callback(dia);
    }];
}

@end
