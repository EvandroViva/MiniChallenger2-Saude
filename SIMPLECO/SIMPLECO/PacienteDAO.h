//
//  PacienteDAO.h
//  SIMPLECO
//
//  Created by Liliane Bezerra Lima on 27/03/15.
//  Copyright (c) 2015 Liliane Bezerra Lima. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Paciente.h"
#import <Parse/Parse.h>

@interface PacienteDAO : NSObject

// SINGLETON
+ (PacienteDAO*)sharedInstance;

// CRUD
// create
-(void)cadastrarPaciente:(Paciente*)pac;

// read
-(void)selecionarPaciente:(NSString*)id_pac;

// update
-(void)alterarPaciente:(Paciente*)pac;

// delete
-(void)excluirPaciente:(NSString*)id_pac;

@end
