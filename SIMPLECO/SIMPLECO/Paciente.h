//
//  Paciente.h
//  SIMPLECO
//
//  Created by Liliane Bezerra Lima on 27/03/15.
//  Copyright (c) 2015 Liliane Bezerra Lima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Paciente : NSObject

@property NSString* nome;
@property NSString* telefone;
@property NSString* email;
@property NSString* senha;

// estrangeira
@property NSString* id_consulta;

@end
