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


-(void)buscarAgenda:(PFObject*)object AndComplete:(void(^)(NSArray*)) callback;
{
    PFRelation* relation = [object relationForKey:@"id_tipoConsulta"];
    [[relation query]findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        NSLog(@"asdasdasdsa");
        NSMutableArray *consultas = [[NSMutableArray alloc]init];
        if (!error) {
            // The find succeeded.
            
            NSLog(@"Successfully retrieved %lu MEDICOS.", (unsigned long)objects.count);
            // Do something with the found objects
            for (PFObject *object in objects)
            {
                Consulta *consulta = [[Consulta alloc]init];
                consulta.diaSemana = object[@"diaSemana"];
                consulta.horarioInicial = object[@"horarioInicial"];
                consulta.horarioFinal = object[@"horarioFinal"];
                consulta.data = object[@"Date"];
                NSLog(@"DIA ? =%@",consulta.horarioInicial);
                [consultas addObject:consulta];
            }
            
        }
        
        else {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
        callback(consultas);
    }];
}

@end
