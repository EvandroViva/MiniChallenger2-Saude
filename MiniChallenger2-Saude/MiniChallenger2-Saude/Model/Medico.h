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
{
    NSString *name;
}

+(instancetype) sharedDoctor;
+(void) resetSharedDoctor;

-(void)setWithPFObject: (PFObject*) object;
-(void)setWithPFUser: (PFUser*) object;

@property PFObject* parseObject;
@property PFUser*   parseUser;
//@property NSString* id_medico;
//@property NSString* nome;
//@property NSString* codTrabalho;
//@property NSString* especialidade;
//@property NSString* id_tipoConsulta;
//@property NSString* id_Endereco;
//@property NSString* email;
//@property NSString* username;

@property bool remember_later;

-(NSString*)name;

-(NSString*)cod;

-(void)setName:(NSString *)n andSave: (bool) s;
-(void)setCod:(NSString *)n andSave: (bool) s;
@end
