//
//  MedicoController.h
//  SIMPLECO
//
//  Created by Liliane Bezerra Lima on 27/03/15.
//  Copyright (c) 2015 Liliane Bezerra Lima. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "Medico.h"
#import "ResultPesqTableViewController.h"

@interface MedicoController : NSObject

// SINGLETON
+ (MedicoController*)sharedInstance;

#pragma mark - Buscar Medicos
-(void)buscarMedicos:(NSString*)especialidade andRegiao:(NSString*)regiao AndComplete: (void(^)(void)) callback;


@end
