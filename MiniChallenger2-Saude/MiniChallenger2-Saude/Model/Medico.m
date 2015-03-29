//
//  Medico.m
//  MiniChallenger2-Saude
//
//  Created by Evandro Remon Pulz Viva on 28/03/15.
//  Copyright (c) 2015 Evandro Remon Pulz Viva. All rights reserved.
//

#import "Medico.h"

@implementation Medico

-(instancetype)initWithPFObject: (PFObject*) object
{
    self = [super init];
    if (self) {
        self.id_medico          = object[@"nome"];
        self.email              = object[@"email"];
        self.especialidade      = object[@"especialidade"];
        self.id_Endereco        = object[@"id_Edereco"];
        self.id_tipoConsulta    = object[@"id_tipoConsulta"];
        self.codTrabalho        = object[@"codTrabalho"];
    }
    return self;
}

@end
