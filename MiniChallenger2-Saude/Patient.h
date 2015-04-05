//
//  Patient.h
//  MiniChallenger2-Saude
//
//  Created by Liliane Bezerra Lima on 05/04/15.
//  Copyright (c) 2015 Evandro Remon Pulz Viva. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface Patient : NSObject
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
