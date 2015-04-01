//
//  Consulta.h
//  SIMPLECO
//
//  Created by Liliane Bezerra Lima on 27/03/15.
//  Copyright (c) 2015 Liliane Bezerra Lima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Consulta : NSObject

// ID
@property NSString* objectID;

// atributos
@property NSDate* data;
    
// estrangeiras
@property NSString* id_tipoConsulta;
@property NSString* id_medico;
@property NSString* id_paciente;

@property NSString* diaSemana;
@property NSNumber* horarioFinal;
@property NSNumber* horarioInicial;
@end

