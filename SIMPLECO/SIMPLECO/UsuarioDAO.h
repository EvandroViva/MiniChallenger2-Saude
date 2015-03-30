//
//  UsuarioDAO.h
//  SIMPLECO
//
//  Created by Liliane Bezerra Lima on 30/03/15.
//  Copyright (c) 2015 Liliane Bezerra Lima. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import "Usuario.h"

@interface UsuarioDAO : NSObject

+(void)signinWithUser:(Usuario*) user AndComplete: (void(^)(bool,NSError*)) callback;

@end
