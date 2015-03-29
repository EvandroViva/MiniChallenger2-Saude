//
//  Medico.h
//  MiniChallenger2-Saude
//
//  Created by Evandro Remon Pulz Viva on 28/03/15.
//  Copyright (c) 2015 Evandro Remon Pulz Viva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface Medico : NSObject

-(instancetype)initWithPFObject: (PFObject*) object;

@property NSString* id_medico;
@property NSString* nome;
@property NSString* email;
@property NSString* codTrabalho;
@property NSString* especialidade;
@property NSString* id_tipoConsulta;
@property NSString* id_Endereco;

@end
