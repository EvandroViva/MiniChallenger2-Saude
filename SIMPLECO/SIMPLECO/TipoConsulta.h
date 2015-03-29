//
//  TipoConsulta.h
//  SIMPLECO
//
//  Created by Liliane Bezerra Lima on 27/03/15.
//  Copyright (c) 2015 Liliane Bezerra Lima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TipoConsulta : NSObject

@property NSString* diaSemana;
@property NSNumber* horarioInicial;
@property NSNumber* horarioFinal;

// estrangeiras
@property NSString* id_medico;
@property NSString* id_consulta;

@end
