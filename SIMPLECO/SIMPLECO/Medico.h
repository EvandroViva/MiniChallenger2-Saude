//
//  Medico.h
//  SIMPLECO
//
//  Created by Liliane Bezerra Lima on 27/03/15.
//  Copyright (c) 2015 Liliane Bezerra Lima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Medico : NSObject

// ID
@property NSString* objectID;

// atributos Medico
@property NSString* nome;
@property NSString* codTrabalho;
@property NSString* especialidade;

// atributos Endereco
@property NSString* endereco;
@property NSNumber* numero;
@property NSString* CEP;
@property NSString* bairro;
@property NSString* regiao;

// estrangeira
@property NSString* id_tipoConsulta;

@end
