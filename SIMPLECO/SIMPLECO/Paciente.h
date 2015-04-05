//
//  Paciente.h
//  SIMPLECO
//
//  Created by Liliane Bezerra Lima on 27/03/15.
//  Copyright (c) 2015 Liliane Bezerra Lima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Paciente : NSObject

// ID
@property NSString* objectID;

// atributos
@property NSString* nome;
@property NSString* telefone;

// estrangeira
@property NSString* id_consulta;

//Parse
@property PFObject* parseObject;
@property PFUser*   parseUser;

+(instancetype) shared;

-(void)setWithPFObject: (PFObject*) object;

@end
