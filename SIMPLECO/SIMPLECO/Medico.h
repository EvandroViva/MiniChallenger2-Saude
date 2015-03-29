//
//  Medico.h
//  SIMPLECO
//
//  Created by Liliane Bezerra Lima on 27/03/15.
//  Copyright (c) 2015 Liliane Bezerra Lima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Medico : NSObject

@property NSString* nome;
@property NSString* email;
@property NSString* codTrabalho;
@property NSString* especialidade;

// estrangeira
@property NSString* id_tipoConsulta;
@property NSString* id_endereco;

@end
