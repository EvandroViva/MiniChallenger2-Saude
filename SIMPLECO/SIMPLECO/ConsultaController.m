
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



-(void)buscarAgenda:(NSNumber*)index andObjectID:(NSString*)ObjectIDD AndComplete:(void(^)(NSMutableArray*)) callback
{
    PFQuery *query = [PFQuery queryWithClassName:@"TipoConsulta"];
    [query whereKey:@"numeroDiaSemana" equalTo:index];
    [query whereKey:@"ObjectID" equalTo:ObjectIDD];
    //[query addAscendingOrder:@"horarioInicial"];
    [query orderByAscending:@"HoraInicio"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
    NSMutableArray *dia = [[NSMutableArray alloc]init];
        if (!error) {
            NSLog(@"Successfully retrieved %lu MEDICOS.", (unsigned long)objects.count);
            for (PFObject *object in objects)
            {
                Consulta *consulta = [[Consulta alloc]init];
                consulta.numeroDiaSemana = object[@"numeroDiaSemana"];
                consulta.HoraInicio = object[@"HoraInicio"];
                consulta.MinInicio = object[@"MinInicio"];
                consulta.HoraFinal = object[@"HoraFinal"];
                consulta.MinFinal = object[@"MinFinal"];
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





//========================================================

//Buscar Excessao

//=======================================================

-(void)buscarExcecao:(NSString*)data andID:(NSString*)objectIDD andComplete:(void(^)(NSMutableArray*)) callback
{
    PFQuery *query = [PFQuery queryWithClassName:@"Excecao"];
    [query whereKey:@"objectIDM" equalTo:objectIDD];
    [query whereKey:@"Date" equalTo:data];
    [query orderByAscending:@"HoraInicio"];
    //[query addAscendingOrder:@"HoraInicio"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        NSMutableArray *excecao = [[NSMutableArray alloc]init];
        if (!error) {
            NSLog(@"Successfully retrieved %lu MEDICOS.", (unsigned long)objects.count);
            for (PFObject *object in objects)
            {
                Consulta *consulta = [[Consulta alloc]init];
                consulta.HoraInicio = object[@"HoraInicio"];
                consulta.MinInicio = object[@"MinInicial"];
                consulta.data = object[@"Data"];
                if ([data isEqualToString:object[@"Date"]])
                    NSLog(@"IGUAL");
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



-(void)MarcouConsultaRetirarVagaParese:(NSString *)data andHora:(NSString*)horario andMin:(NSString*)min andID:(NSString*)objectIDD andIDP:(NSString*)nomePaciente andTel:(NSString*)TelPaciente AndComplete:(void(^)(void))callback
{
    PFObject *gameScore = [PFObject objectWithClassName:@"Excecao"];
    gameScore[@"objectIDM"] = objectIDD;
    gameScore[@"Date"] = data;
    gameScore[@"HoraInicio"] = horario;
    gameScore[@"MinInicial"] = min;
    gameScore[@"NomePaciente"] = nomePaciente;
    gameScore[@"TelPaciente"] = TelPaciente;
    [gameScore saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"Sucesso");
        } else {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}

-(void)BuscarPaciente:(NSString*)email andUser:(NSString*)user AndComplete:(void(^)(NSArray*))callback
{
     PFQuery *query = [PFQuery queryWithClassName:@"Paciente"];
    [query whereKey:@"email" equalTo:email];
    [query whereKey:@"UserName" equalTo:user];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        NSMutableArray *pacientes = [[NSMutableArray alloc]init];
        if (!error) {
            NSLog(@"Successfully retrieved %lu MEDICOS.", (unsigned long)objects.count);
            for (PFObject *object in objects)
            {
                Paciente *paciente = [[Paciente alloc]init];
                paciente.objectID = [object objectId];
                paciente.nome = object[@"nome"];
                paciente.telefone = object[@"telefone"];
                [pacientes addObject:paciente];
            }
        }
        else {
            NSLog(@"Error: %@ %@", error, [error userInfo]);

        }
        callback(pacientes);
    }];

    
}

-(void)creatingConsultaComData:(NSDate*)data eIdPaciente:(id)user AndComplete: (void(^)(void)) callback;{
    
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
        
        callback();
        
    }];
    
}








@end


