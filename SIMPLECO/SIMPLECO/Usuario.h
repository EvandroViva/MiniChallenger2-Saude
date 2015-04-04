//
//  Usuario.h
//  SIMPLECO
//
//  Created by Liliane Bezerra Lima on 30/03/15.
//  Copyright (c) 2015 Liliane Bezerra Lima. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface Usuario : NSObject

// ID
@property NSString* objectID;

// atributos
@property NSString* usuario;
@property NSString* email;
@property NSString* senha;
@property PFObject* paciente;

@end
