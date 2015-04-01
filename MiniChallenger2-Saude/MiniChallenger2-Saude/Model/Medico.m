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

-(void)setWithPFObject: (PFObject*) object
{
    self.parseObject        = object;
    self.nome               = object[@"nome"];
    self.especialidade      = object[@"especialidade"];
    self.id_Endereco        = object[@"id_Edereco"];
    self.id_tipoConsulta    = object[@"id_tipoConsulta"];
    self.codTrabalho        = object[@"codTrabalho"];
}

-(void)setWithPFUser: (PFUser*) user
{
    self.parseUser          = user;
    self.email              = user.email;
    self.username           = user.username;
}

@end
