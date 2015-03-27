//
//  Consulta.h
//  SIMPLECO
//
//  Created by Liliane Bezerra Lima on 27/03/15.
//  Copyright (c) 2015 Liliane Bezerra Lima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Consulta : NSObject

@property NSString* id_consulta;
@property NSDate* data;
@property NSString* id_tipoConsulta;
@property NSString* medico;
@property NSString* paciente;
@property NSString* endereco;

@end
