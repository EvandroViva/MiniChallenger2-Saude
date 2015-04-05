//
//  ConsultaController.h
//  SIMPLECO
//
//  Created by Liliane Bezerra Lima on 27/03/15.
//  Copyright (c) 2015 Liliane Bezerra Lima. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "Medico.h"
#import "ResultPesqTableViewController.h"
#import "Consulta.h"
#import "ConsultaViewController.h"
#import "RegiaoTableViewController.h"
#import "Paciente.h"

@interface ConsultaController : NSObject

+ (ConsultaController*)sharedInstance;
-(void)creatingConsultaComData:(NSDate*)data eIdPaciente:(PFObject *)paciente AndComplete: (void(^)(void)) callback;

#pragma mark - Buscar Consultas
-(void)buscarAgenda:(NSNumber*)index andObjectID:(NSString*)ObjectIDD AndComplete:(void(^)(NSMutableArray*)) callback;

-(void)buscarExcecao:(NSString*)data andID:(NSString*)objectIDD andComplete:(void(^)(NSMutableArray*)) callback;

-(void)MarcouConsultaRetirarVagaParese:(NSString *)data andHora:(NSString*)horario andMin:(NSString*)min andID:(NSString*)objectIDD andIDP:(NSString*)objectIDP AndComplete:(void(^)(void))callback;

-(void)BuscarPaciente:(NSString*)email andUser:(NSString*)user AndComplete:(void(^)(NSArray*))callback;

-(void)Marcou:(void(^)(void))callback;

@end
