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

// SINGLETON
//==========================================================

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
        }else {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
        callback(dia);
    }];
}
     
     
-(void)creatingConsultaComData:(NSDate*)data eIdPaciente:(id)user {//AndComplete: (void(^)(void)) callback;{
    NSLog(@"A DE AZARADO");
    med=[ResultPesqTableViewController sharedInstance];
    
    PFObject *persona=[PFObject objectWithClassName:@"Consulta"];
    
    //persona[@"data"]=data;
//    NSString *a=[med.medicoSelecionado objectID];
    persona[@"p_medico"] = [med.medicoSelecionado parseObject];
//    a=[paciente objectId];

    PFRelation* pac=[user relationForKey:@"paciente"];
    [[pac query] findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        NSLog(@"@lu", (unsigned long)[objects count]);
        if([objects count]>0){
            persona[@"p_paciente"]=objects[0];
        }
    }];
    
//    a=med.medicoSelecionado.id_tipoConsulta;
//    persona[@"p_tipoConsulta"]=med.medicoSelecionado.id_tipoConsulta;
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


@end
