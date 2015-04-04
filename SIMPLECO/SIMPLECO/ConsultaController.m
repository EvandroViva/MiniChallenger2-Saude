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

//========================================================
//Buscar Agenda
//=======================================================

-(void)buscarAgenda:(PFObject*)object andDiaSelec:(NSNumber*)diaSelecionado AndComplete:(void(^)(NSMutableArray*)) callback;
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
            NSString *message = @"Busca";
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Erro Conexao" message:message delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil,nil];
            [alertView show];
        }
        callback(dia);
    }];
}



//========================================================
//Buscar Excessao
//=======================================================
-(void)buscarExcecao:(PFObject*)object andIndex:(NSNumber*)index andDiaSelec:(NSDate*)data andComplete:(void(^)(NSMutableArray*)) callback
{
    PFRelation* relation = [object relationForKey:@"excecao"];
    PFQuery *query = [relation query];
    [query whereKey:@"Data" equalTo:data];
    [query addAscendingOrder:@"horarioInicial"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        NSMutableArray *excecao = [[NSMutableArray alloc]init];
        if (!error) {
               NSLog(@"Successfully retrieved %lu MEDICOS.", (unsigned long)objects.count);
            for (PFObject *object in objects)
            {
                Consulta *consulta = [[Consulta alloc]init];
                consulta.horarioInicial = object[@"horarioInicial"];
                consulta.data = object[@"Data"];
                [excecao addObject:consulta];
            }
        }
        else {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
            NSString *message = @"Excecao";
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Erro Conexao" message:message delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil,nil];
            [alertView show];
        }
        callback(excecao);
    }];
    
    
}



-(void)MarcouConsultaRetirarVagaParese:(PFObject*)object AndDiaSelec:(NSNumber*)diaSelecionado AndHoraInicial:(NSNumber*)horario AndComplete:(void(^)(void))callback
{
//    PFRelation* relation = [object relationForKey:@"id_tipoConsulta"];
//    PFQuery *query = [relation query];
//    [query whereKey:@"numeroDiaSemana" equalTo:diaSelecionado];
//    [query whereKey:@"horarioInicial" equalTo:horario];
//    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
//        if (!error) {
//
//            NSLog(@"Successfully retrieved %lu MEDICOS.", (unsigned long)objects.count);
//            for (PFObject *object in objects)
//            {
//                NSLog(@"Quem ta aqui?%@",object);
//                [object deleteEventually];
//            }
//            
//        }
//        else {
//            NSLog(@"Error: %@ %@", error, [error userInfo]);
//        }
//        callback();
//        }];
}

@end
