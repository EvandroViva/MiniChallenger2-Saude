//
//  Endereco.h
//  SIMPLECO
//
//  Created by Liliane Bezerra Lima on 27/03/15.
//  Copyright (c) 2015 Liliane Bezerra Lima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Endereco : NSObject

@property NSString* endereco;
@property NSNumber* numero;
@property NSString* complemento;
@property NSString* referencia;
@property NSString* bairro;
@property NSString* CEP;
@property NSString* regiao;

// estrangeira
@property NSString* id_medico;

@end
