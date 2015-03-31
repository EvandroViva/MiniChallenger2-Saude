//
//  Medico.m
//  MiniChallenger2-Saude
//
//  Created by Evandro Remon Pulz Viva on 28/03/15.
//  Copyright (c) 2015 Evandro Remon Pulz Viva. All rights reserved.
//

#import "Medico.h"

static Medico* vSharedDoctor = nil;

@implementation Medico

+(instancetype) sharedDoctor
{
    if (vSharedDoctor == nil) {
        vSharedDoctor = [[Medico alloc] init];
    }
    return vSharedDoctor;
}

-(instancetype)init
{
    self = [super init];
    if (self) {
        self.remember_later = false;
    }
    return self;
}

-(instancetype)initWithPFObject: (PFObject*) object
{
    self = [self init];
    if (self) {
        self.id_medico          = object[@"nome"];
        self.especialidade      = object[@"especialidade"];
        self.id_Endereco        = object[@"id_Edereco"];
        self.id_tipoConsulta    = object[@"id_tipoConsulta"];
        self.codTrabalho        = object[@"codTrabalho"];
    }
    return self;
}

-(void)setWithPFObject: (PFObject*) object
{
    self.id_medico          = object[@"nome"];
    self.especialidade      = object[@"especialidade"];
    self.id_Endereco        = object[@"id_Edereco"];
    self.id_tipoConsulta    = object[@"id_tipoConsulta"];
    self.codTrabalho        = object[@"codTrabalho"];
}

@end
