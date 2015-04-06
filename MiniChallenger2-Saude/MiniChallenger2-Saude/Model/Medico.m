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

+(void) resetSharedDoctor
{
    vSharedDoctor = nil;
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
//    self.nome               = object[@"nome"];
//    self.especialidade      = object[@"especialidade"];
//    self.id_Endereco        = object[@"id_Edereco"];
//    self.id_tipoConsulta    = object[@"id_tipoConsulta"];
//    self.codTrabalho        = object[@"codTrabalho"];
}

-(void)setWithPFUser: (PFUser*) user
{
    self.parseUser          = user;
//    self.email              = user.email;
//    self.username           = user.username;
}

-(NSString*)name
{
    return self.parseObject[@"nome"];
}

-(NSString*)cod
{
    return self.parseObject[@"codTrabalho"];
}

-(NSString*)specialty
{
    return self.parseObject[@"especialidade"];
}

-(NSString*)street
{
    return self.parseObject[@"endereco"];
}

-(NSNumber*)number
{
    return self.parseObject[@"numero"];
}

-(NSString*)district
{
    return self.parseObject[@"regiao"];
}

-(NSString*)burgh
{
    return self.parseObject[@"bairro"];
}

-(NSString*)cep
{
    return self.parseObject[@"CEP"];
}

-(void)setName:(NSString *)n andSave: (bool) s
{
    self.parseObject[@"nome"] = n;
    if (s) {
        [self.parseObject saveInBackground];
    }
}

-(void)setCod:(NSString *)n andSave: (bool) s
{
    self.parseObject[@"codTrabalho"] = n;
    if (s) {
        [self.parseObject saveInBackground];
    }
}

-(void)setSpecialty:(NSString *)n andSave: (bool) s
{
    self.parseObject[@"especialidade"] = n;
    if (s) {
        [self.parseObject saveInBackground];
    }
}

-(void)setStreet:(NSString *)n andSave: (bool) s
{
    self.parseObject[@"endereco"] = n;
    if (s) {
        [self.parseObject saveInBackground];
    }
}

-(void)setNumber:(NSNumber *)n andSave: (bool) s
{
    self.parseObject[@"numero"] = n;
    if (s) {
        [self.parseObject saveInBackground];
    }
}

-(void)setDistrict:(NSString *)n andSave: (bool) s
{
    self.parseObject[@"regiao"] = n;
    if (s) {
        [self.parseObject saveInBackground];
    }
}

-(void)setBurgh:(NSString *)n andSave: (bool) s
{
    self.parseObject[@"bairro"] = n;
    if (s) {
        [self.parseObject saveInBackground];
    }
}

-(void)setCep:(NSString *)n andSave: (bool) s
{
    self.parseObject[@"CEP"] = n;
    if (s) {
        [self.parseObject saveInBackground];
    }
}

@end
