//
//  Medico.h
//  MiniChallenger2-Saude
//
//  Created by Evandro Remon Pulz Viva on 28/03/15.
//  Copyright (c) 2015 Evandro Remon Pulz Viva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "User.h"

@interface Medico : NSObject

+(instancetype) sharedDoctor;

-(instancetype)initWithPFObject: (PFObject*) object;
-(void)setWithPFObject: (PFObject*) object;

@property NSString* id_medico;
@property NSString* nome;
@property NSString* codTrabalho;
@property NSString* especialidade;
@property NSString* id_tipoConsulta;
@property NSString* id_Endereco;
@property bool remember_later;

@end
