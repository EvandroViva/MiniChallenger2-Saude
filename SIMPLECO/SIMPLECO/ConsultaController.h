//
//  ConsultaController.h
//  SIMPLECO
//
//  Created by Liliane Bezerra Lima on 27/03/15.
//  Copyright (c) 2015 Liliane Bezerra Lima. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RegiaoTableViewController.h"

@interface ConsultaController : NSObject

+ (ConsultaController*)sharedInstance;
-(void)creatingConsultaComData:(NSDate*)data eIdPaciente:(PFObject *)paciente /*AndComplete: (void(^)(void)) callback*/;

@end
