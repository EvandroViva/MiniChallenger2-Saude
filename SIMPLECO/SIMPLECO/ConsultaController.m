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
        }else {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
            NSString *message = @"Busca";
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Erro Conexao" message:message delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil,nil];
            [alertView show];
        }
        callback(dia);
    }];
}
     
     
-(void)creatingConsultaComData:(NSDate*)data eIdPaciente:(id)user AndComplete: (void(^)(void)) callback;{
    NSLog(@"A DE AZARADO");
    med=[ResultPesqTableViewController sharedInstance];
    
    PFObject *persona=[PFObject objectWithClassName:@"Consulta"];
    
    //persona[@"data"]=data;
//    NSString *a=[med.medicoSelecionado objectID];
    persona[@"p_medico"] = [[med.medicoSelecionado parseObject] objectId];
//    a=[paciente objectId];

    PFRelation* pac=[user relationForKey:@"paciente"];
    [[pac query] findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        NSLog(@"@lu", (unsigned long)[objects count]);
        if([objects count]>0){
            persona[@"p_paciente"]=[user username];
        }
    }];
//    PFQuery* tConsul=[PFQuery queryWithClassName:tipoConsulta];
//    [[pac query] findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
//        NSLog(@"@lu", (unsigned long)[objects count]);
//        if([objects count]>0){
//            persona[@"p_paciente"]=[objects[0] objectId];
//        }
//    }];
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
        callback();
    }];
}




//========================================================
//Buscar Excessao
//=======================================================
-(void)buscarExcecao:(PFObject*)object andIndex:(NSNumber*)index andDiaSelec:(NSDate*)data andComplete:(void(^)(NSMutableArray*)) callback
{
    
    PFRelation* relation = [object relationForKey:@"exceto"];
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
    
//   // PFUser *user = [PFUser currentUser];
//    PFRelation *relation = [object relationForKey:@"exceto"];
//    PFObject *post = [PFObject objectWithClassName:@"Excecao"];
//    post[@"horarioInicial"] = horario;
//    object[@"exceto"] = post;
    //relation = post;
    
    //[relation addObject:post];
    
   // [object saveInBackground];
    
//      PFRelation* relation = [object relationForKey:@"excecao"];
//    PFObject *consMarcada = [PFObject objectWithClassName:@"Medico"];
//    consMarcada[@"horarioInicial"] = horario;
//    [relation addObject:consMarcada];
//    //[object saveInBackground];
//    
////    [object setObject:consMarcada forKey:@"exceto"];
////    consMarcada[@"horarioInicial"] = diaSelecionado;
//    PFRelation*relation = [object relationForKey:@"excecao"];
//    PFObject *post = [PFObject objectWithClassName:@"Excecao"];
//    post[@"horarioInicial"] = horario;
//    [relation addObject:post];
//    
   PFUser* user = [PFUser objectWithClassName:@"Medico"];
    [user objectForKey:@"exceto"];
    PFObject *excecao = [PFObject objectWithClassName:@"Excecao"];
    [excecao setObject:horario forKey:@"horarioInicial"];
    [user setObject:excecao forKey:@"exceto"];
//    
//    
//    PFRelation *relation = [object relationForKey:@"Excecoes"];
//    [relation addObject:excecao];
    
    [user saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"sucesso");
        } else {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];

    
    
   
}

-(void)Marcou:(void(^)(void))callback
{

    
}

@end
