//
//  MedicoDAO.h
//  SIMPLECO
//
//  Created by Liliane Bezerra Lima on 27/03/15.
//  Copyright (c) 2015 Liliane Bezerra Lima. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Medico.h"
#import <Parse/Parse.h>

@interface MedicoDAO : NSObject

// SINGLETON
+ (MedicoDAO*)sharedInstance;

// CRUD
// create
-(void)cadastrarMedico:(Medico*)med;

// read
-(void)selecionarMedico:(NSString*)id_med;

// update
-(void)alterarMedico:(Medico*)med;

// delete
-(void)excluirMedico:(NSString*)id_med;

@end
